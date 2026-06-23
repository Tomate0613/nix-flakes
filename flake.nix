{
  description = "Spyglassmc";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:

    let
      inherit (nixpkgs) lib;

      systems = lib.systems.flakeExposed;
      forAllSystems = lib.genAttrs systems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          default = pkgs.buildNpmPackage {
            pname = "spyglassmc-language-server";
            version = "1.0.0";

            src = ./.;

            npmDepsHash = "sha256-9lNfRdUqBn/uYCvbjWRnDBgCDxgM7ON7pC296yKc8fk=";
            npmDepsFetcherVersion = 2;

            dontNpmBuild = true;

            postInstall = ''
              mkdir -p $out/bin

              makeWrapper ${lib.getExe pkgs.nodejs} $out/bin/spyglassmc-language-server \
                --inherit-argv0 \
                --add-flags $out/lib/node_modules/spyglassmc-language-server/node_modules/@spyglassmc/language-server/bin/server.js
            '';
          };
        }
      );
    };
}
