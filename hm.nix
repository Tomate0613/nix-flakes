{ inputs }:
{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.neovim.bridge;

  db = import ./servers.nix {
    inherit inputs;
    system = pkgs.system;
  };

  enabledServers = lib.filterAttrs (_: v: v.enable || false) cfg.servers;

  installedServers = lib.filterAttrs (
    _: v: (v.enable || false) || (v.installOnly || false)
  ) cfg.servers;

  packages =
    lib.flatten (lib.mapAttrsToList (name: _: db.${name}.packages) installedServers)
    ++ cfg.extraPackages;

  lua = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: v: ''
      ${db.${name}.config or ""}
      ${if v.skipEnable then "" else "vim.lsp.enable(\"${name}\")"}
    '') enabledServers
  );

  lspBinPath = lib.makeBinPath packages;

  luaConstants = lib.generators.toLua { } cfg.constants;
in
{
  options.programs.neovim.bridge = {
    enable = lib.mkEnableOption "Enable Neovim bridge configuration";

    servers = lib.mkOption {
      default = { };
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            enable = lib.mkEnableOption "Enable the language server";

            skipEnable = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
          };
        }
      );
    };

    extraPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
    };

    constants = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
    };
  };

  config = lib.mkIf cfg.enable {

    xdg.configFile."nvim/lua/generated/lsp.lua".text = ''
      vim.env.PATH = "${lspBinPath}:" .. vim.env.PATH

    ''
    + lua;

    xdg.configFile."nvim/lua/generated/constants.lua".text = ''
      return ${luaConstants}
    '';
  };
}
