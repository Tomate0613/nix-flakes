{ inputs }:
{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.programs.neovim.bridge;

  servers = import ./servers.nix {
    inherit inputs;
    system = pkgs.system;
  };

  formatters = import ./formatters.nix {
    inherit inputs;
    system = pkgs.system;
  };

  enabledServers = lib.filterAttrs (_: v: v.enable || false) cfg.servers;

  installedServers = lib.filterAttrs (
    _: v: (v.enable || false) || (v.installOnly || false)
  ) cfg.servers;

  packages =
    lib.flatten (lib.mapAttrsToList (name: _: servers.${name}.packages) installedServers)
    ++ cfg.extraPackages;

  selectedFormatters = lib.unique (lib.flatten (lib.attrValues cfg.formatters));

  usedFormatterDefinitions = lib.filterAttrs (
    name: _: builtins.elem name selectedFormatters
  ) formatters;

  lspLua = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: v: ''
      ${servers.${name}.config or ""}
      ${if v.skipEnable then "" else "vim.lsp.enable(\"${name}\")"}
    '') enabledServers
  );

  conformLua =
    let
      formatterDefinitions = lib.generators.toLua { } usedFormatterDefinitions;

      formattersByFt = lib.generators.toLua { } cfg.formatters;
    in
    ''
      return {
        formatters = ${formatterDefinitions};
        formatters_by_ft = ${formattersByFt};
      }
    '';

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

    formatters = lib.mkOption {
      default = { };

      type = lib.types.attrsOf (lib.types.listOf lib.types.str);

      description = ''
        Formatters by filetype. Values are conform.nvim formatter names.
      '';
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
    xdg.configFile."nvim/lua/generated/path.lua".text =
      "vim.env.PATH = \"${lspBinPath}:\" .. vim.env.PATH";

    xdg.configFile."nvim/lua/generated/lsp.lua".text = lspLua;

    xdg.configFile."nvim/lua/generated/conform.lua".text = conformLua;

    xdg.configFile."nvim/lua/generated/constants.lua".text = "return ${luaConstants}";
  };
}
