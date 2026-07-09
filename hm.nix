{ inputs }:
{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.nvim-lsp;

  db = import ./servers.nix {
    inherit inputs;
    system = pkgs.system;
  };

  enabledServers = lib.filterAttrs (_: v: v.enable || false) cfg.servers;

  installedServers = lib.filterAttrs (
    _: v: (v.enable || false) || (v.installOnly || false)
  ) cfg.servers;

  packages = lib.flatten (lib.mapAttrsToList (name: _: db.${name}.packages) installedServers);

  lua = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: _: ''
      ${db.${name}.config or ""}
      vim.lsp.enable("${name}")
    '') enabledServers
  );

  lspBinPath = lib.makeBinPath packages;
in
{
  options.programs.nvim-lsp = {
    enable = lib.mkEnableOption "Generate Neovim LSP configuration";

    servers = lib.mkOption {
      default = { };
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            enable = lib.mkEnableOption "Enable the language server";

            installOnly = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
          };
        }
      );
    };
  };

  config = lib.mkIf cfg.enable {

    xdg.configFile."nvim/lua/generated/lsp.lua".text = ''
      vim.env.PATH = "${lspBinPath}:" .. vim.env.PATH

    ''
    + lua;

  };
}
