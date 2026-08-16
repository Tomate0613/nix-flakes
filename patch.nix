{
  lockFile,
  lib,
  registry,
  pkgs,
  buildDependencies,
  attrs,
}:
let
  shouldSkip =
    v:
    let
      # TODO Allow for cross compilation, we do not know if a package is used as dependency or devDependency here, not skipping it if its either on the host or build platform is most likely best option
      systemParts = lib.splitString "-" pkgs.stdenv.hostPlatform.system;
      cpuMap = {
        x86_64 = "x64";
        i686 = "ia32";
        aarch64 = "arm64";
        ppc64 = "ppc64";
      };
      osMap = {
        linux = "linux";
        darwin = "darwin";
        windows = "win32";
        aix = "aix";
      };
      currentCpu = cpuMap.${builtins.elemAt systemParts 0};
      currentOs = osMap.${builtins.elemAt systemParts 1};
      currentLibc = pkgs.stdenv.hostPlatform.libc;

      osMatches = v ? os && builtins.elem currentOs v.os;
      cpuMatches = v ? cpu && builtins.elem currentCpu v.cpu;
      libcMatches = v ? libc && builtins.elem currentLibc v.libc;
    in
    (v ? os && !osMatches) || (v ? cpu && !cpuMatches) || (v ? libc && !libcMatches);
  splitVersion = name: lib.splitString "@" (lib.head (lib.splitString "(" name));
  getVersion = name: lib.last (splitVersion name);
  withoutVersion = name: lib.concatStringsSep "@" (lib.init (splitVersion name));
  switch =
    n: v: options:
    if ((lib.length options) == 0) then
      throw "No matching case found, for n=${n} v=${builtins.toJSON v}!"
    else if ((lib.head options).case or true) then
      (lib.head options).result
    else
      switch n v (lib.tail options);
  mkTarball =
    pkg: contents:
    pkgs.runCommand
      "${lib.last (lib.init (lib.splitString "/" (lib.head (lib.splitString "(" pkg))))}.tgz"
      { }
      ''
        tar --posix -czf $out -C ${contents} .
      '';

  unpackTarball =
    tarball: outdir:
    pkgs.runCommand outdir { } ''
      mkdir -p $out
      tar -xzf ${tarball} --strip-components=1 -C $out
    '';
  findTarball =
    n: v:
    switch n v [
      {
        case = (v.resolution.type or "") == "git";
        result = mkTarball n (fetchGit {
          url = v.resolution.repo;
          rev = v.resolution.commit;
          shallow = true;
        });
      }
      {
        case =
          lib.hasAttrByPath [ "resolution" "tarball" ] v && lib.hasAttrByPath [ "resolution" "integrity" ] v;
        result = pkgs.fetchurl {
          url = v.resolution.tarball;
          ${lib.head (lib.splitString "-" v.resolution.integrity)} = v.resolution.integrity;
        };
      }
      {
        case = lib.hasPrefix "https://codeload.github.com" (v.resolution.tarball or "");
        result =
          let
            m = lib.strings.match "https://codeload.github.com/([^/]+)/([^/]+)/tar\\.gz/([a-f0-9]+)" v.resolution.tarball;
          in
          mkTarball n (fetchGit {
            url = "https://github.com/${lib.elemAt m 0}/${lib.elemAt m 1}";
            rev = (lib.elemAt m 2);
            shallow = true;
          });
      }
      {
        case = (v ? id);
        result =
          let
            split = lib.splitString "/" v.id;
          in
          mkTarball n (fetchGit {
            url = "https://${lib.concatStringsSep "/" (lib.init split)}.git";
            rev = (lib.last split);
            shallow = true;
          });
      }
      {
        case = true;
        result =
          let
            name = withoutVersion n;
            baseName = lib.last (lib.splitString "/" (withoutVersion n));
            version = getVersion n;
          in
          pkgs.fetchurl {
            url = "${registry}/${name}/-/${baseName}-${version}.tgz";
            ${lib.head (lib.splitString "-" v.resolution.integrity)} = v.resolution.integrity;
          };
      }
    ];

  findBuiltTarball =
    n: v:
    if lib.elem (withoutVersion n) buildDependencies then
      mkTarball n (
        pkgs.callPackage ./derivation.nix rec {
          src = unpackTarball (findTarball n v) "${n}-unpacked";
          lockFile = src + /pnpm-lock.yaml;

          pname = withoutVersion n;
          version = getVersion n;

          inherit (attrs)
            nativeBuildInputs
            buildInputs
            registry
            buildDependencies
            ;
        }
      )
    else
      findTarball n v;
in
lockFile
// {
  packages = lib.mapAttrs (
    n: v:
    v
    // (
      if shouldSkip v then
        { }
      else
        {
          resolution.tarball = "file:${findBuiltTarball n v}";
        }
    )
  ) lockFile.packages;
}
