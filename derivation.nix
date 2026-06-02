{
  pkgs,
  lib,
  src,
  lockFile,
  outDir ? null,
  pname,
  version,
  nativeBuildInputs ? [ ],
  buildInputs ? [ ],
  preBuild ? null,
  registry ? "https://registry.npmjs.org",
  buildDependencies ? [ ],
  buildCommand ? null,
  runScripts ? true,
  ...
}@attrs:

pkgs.stdenv.mkDerivation (
  let
    parsedLockfile = import ./parse.nix {
      inherit lockFile;
      inherit pkgs;
    };
    patchedLockfile = import ./patch.nix {
      inherit pkgs;
      inherit lib;
      inherit registry;
      inherit buildDependencies;
      inherit nativeBuildInputs;
      lockFile = parsedLockfile;

      system = pkgs.stdenv.hostPlatform.system;
    };
    patchedLockfileYaml = pkgs.writeText "pnpm-lock.yaml" (lib.toJSON patchedLockfile);
  in
  lib.recursiveUpdate
    {
      inherit
        src
        pname
        version
        nativeBuildInputs
        buildInputs
        preBuild
        ;

      strictDeps = true;

      env = {
        CI = "TRUE";
      };

      configurePhase = ''
        export HOME=$(mktemp -d)

        runHook preConfigure

        cp -fv ${patchedLockfileYaml} pnpm-lock.yaml

        store=$(pnpm store path)
        mkdir -p $(dirname $store)

        pnpm --version
        pnpm config set pmOnFail warn

        ${lib.optionalString runScripts "pnpm run --if-present preinstall"}

        pnpm install \
          --ignore-scripts \
          --frozen-lockfile \
          --offline

        ${lib.optionalString runScripts "pnpm run --if-present postinstall"}

        runHook postConfigure
      '';

      buildPhase = ''
        runHook preBuild

        ${
          if buildCommand != null then
            "pnpm run ${buildCommand}"
          else
            "
            pnpm run --if-present prepare
            pnpm run --if-present prebuild
            pnpm run --if-present build
            pnpm run --if-present prepublishOnly
          "
        }

        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall

        ${if outDir != null then "mv ${outDir} $out" else "mkdir $out; cp -r . $out"}

        runHook postInstall
      '';

    }
    (
      attrs
      // {
        pkgs = null;
        lib = null;
        lockFile = null;
        outDir = null;
        registry = null;
        buildDependencies = null;
        buildCommand = null;
        runScripts = null;
      }
    )
)
