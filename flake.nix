{
  description = "JDK Mission Control";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, self }:

    let
      inherit (nixpkgs) lib;

      systems = lib.systems.flakeExposed;
      forAllSystems = lib.genAttrs systems;

      nixpkgsFor = forAllSystems (system: nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = self.packages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [ default ];
          };
        }
      );
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        rec {
          jmc = pkgs.stdenv.mkDerivation {
            pname = "jmc";
            version = "9.1.1";

            src = pkgs.fetchurl {
              url = "https://github.com/adoptium/jmc-build/releases/download/9.1.1/org.openjdk.jmc-9.1.1-linux.gtk.x86_64.tar.gz";
              hash = "sha256-ARYSN8f4g10oLN7G3NL0XIIeDGmgI4Ptzt0nf1WnI34=";
            };

            nativeBuildInputs = with pkgs; [
              autoPatchelfHook
              wrapGAppsHook3
            ];

            buildInputs = with pkgs; [
              (lib.getLib stdenv.cc.cc)
              glib
              gtk3
              gsettings-desktop-schemas
              makeWrapper
            ];

            autoPatchelfIgnoreMissingDeps = true;

            unpackPhase = ''
              tar -xzf $src
              ls
            '';

            installPhase = ''
              mkdir -p $out/opt/jmc
              cp -r * $out/opt/jmc

              mkdir -p $out/bin
              makeWrapper $out/opt/jmc/"JDK Mission Control"/jmc $out/bin/jmc \
                --set LD_LIBRARY_PATH "${
                  lib.makeLibraryPath (
                    with pkgs;
                    [
                      glib
                    ]
                  )
                }"
            '';
          };

          default = jmc;
        }
      );
    };
}
