{
  description = "JDK Mission Control";

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
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [ jdk25 ];

            env = {

              LD_LIBRARY_PATH = lib.makeLibraryPath (
                with pkgs;
                [
                  glib
                ]
              );
            };
          };
        }
      );
    };
}
