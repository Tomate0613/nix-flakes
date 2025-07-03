{
  description = "Minecraft";

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
            config.allowUnfree = true;
          };
          setup = pkgs.writeShellApplication {
            name = "setup-intellij";

            runtimeInputs = with pkgs; [ xmlstarlet ];
            text = "${./setup-intellij.sh}";
          };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              jetbrains.jdk
              setup
            ];

            __GL_THREADED_OPTIMIZATIONS = 0;
            LD_LIBRARY_PATH = lib.makeLibraryPath (
              with pkgs;
              [
                (lib.getLib stdenv.cc.cc)

                ## native versions
                glfw3-minecraft
                openal

                ## openal
                alsa-lib
                libjack2
                libpulseaudio
                pipewire

                ## glfw
                libGL
                xorg.libX11
                xorg.libXcursor
                xorg.libXext
                xorg.libXrandr
                xorg.libXxf86vm

                udev # oshi

                flite # Text to speech (Otherwise minecraft will log an error every time it launches)
              ]
            );
          };
        }
      );
    };
}
