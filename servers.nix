{ inputs, system }:
let
  pkgs = inputs.nixpkgs.legacyPackages."${system}";
  fp = input: input.package."${system}".default;
in
with pkgs;
{
  ada_ls = {
    packages = [ ];
  };
  agda_ls = {
    packages = [ ];
  };
  aiken = {
    packages = [ aiken ];
  };
  air = {
    packages = [ air-formatter ];
  };
  alloy_ls = {
    packages = [ alloy ];
  };
  anakin_language_server = {
    packages = [ ];
  };
  angularls = {
    packages = [ angular-language-server ];
  };
  ansiblels = {
    packages = [ ansible-language-server ];
  };
  antlersls = {
    packages = [ ];
  };
  apex_ls = {
    packages = [ ];
  };
  arduino_language_server = {
    packages = [ arduino-language-server ];
  };
  asm_lsp = {
    packages = [ asm-lsp ];
  };
  ast_grep = {
    packages = [ ast-grep ];
  };
  astro = {
    packages = [ nodePackages."@astrojs/language-server" ];
  };
  atlas = {
    packages = [ atlas ];
  };
  autohotkey_lsp = {
    packages = [ ];
  };
  autotools_ls = {
    packages = [ autotools-language-server ];
  };
  awk_ls = {
    packages = [ awk-language-server ];
  };
  azure_pipelines_ls = {
    packages = [ ];
  };
  bacon_ls = {
    packages = [ ];
  };
  ballerina = {
    packages = [ ];
  };
  basedpyright = {
    packages = [ basedpyright ];
  };
  bashls = {
    packages = [ bash-language-server ];
  };
  basics_ls = {
    packages = [ ];
  };
  bazelrc_lsp = {
    packages = [ ];
  };
  beancount = {
    packages = [ beancount-language-server ];
  };
  bicep = {
    packages = [ ];
  };
  biome = {
    packages = [ biome ];
  };
  bitbake_language_server = {
    packages = [ ];
  };
  bitbake_ls = {
    packages = [ ];
  };
  blueprint_ls = {
    packages = [ blueprint-compiler ];
  };
  bqls = {
    packages = [ ];
  };
  bqnlsp = {
    packages = [ ];
  };
  bright_script = {
    packages = [ ];
  };
  bsl_ls = {
    packages = [ ];
  };
  buck2 = {
    packages = [ ];
  };
  buddy_ls = {
    packages = [ ];
  };
  buf_ls = {
    packages = [ buf ];
  };
  bzl = {
    packages = [ ];
  };
  c3_lsp = {
    packages = [
      c3c
      c3-lsp
    ];
  };
  cadence = {
    packages = [ ];
  };
  cairo_ls = {
    packages = [ ];
  };
  ccls = {
    packages = [ ccls ];
  };
  cds_lsp = {
    packages = [ ];
  };
  circom-lsp = {
    packages = [ ];
  };
  clangd = {
    packages = [ clang-tools ];
  };
  clarity_lsp = {
    packages = [ ];
  };
  clojure_lsp = {
    packages = [ clojure-lsp ];
  };
  cmake = {
    packages = [ cmake-language-server ];
  };
  cobol_ls = {
    packages = [ ];
  };
  codeqlls = {
    packages = [ codeql ];
  };
  coffeesense = {
    packages = [ ];
  };
  contextive = {
    packages = [ ];
  };
  coq_lsp = {
    packages = [ coqPackages.coq-lsp ];
  };
  crystalline = {
    packages = [
      crystalline
      crystal
    ];
  };
  csharp_ls = {
    packages = [
      csharp-ls
      dotnet-sdk
    ];
  };
  css_variables = {
    packages = [ ];
  };
  cssls = {
    packages = [ vscode-langservers-extracted ];
  };
  cssmodules_ls = {
    packages = [ ];
  };
  cucumber_language_server = {
    packages = [ ];
  };
  cue = {
    packages = [ cue ];
  };
  custom_elements_ls = {
    packages = [ ];
  };
  cypher_ls = {
    packages = [ ];
  };
  daedalus_ls = {
    packages = [ ];
  };
  dafny = {
    packages = [ ];
  };
  dagger = {
    packages = [ cuelsp ];
  };
  dartls = {
    packages = [ dart ];
  };
  dcmls = {
    packages = [ ];
  };
  debputy = {
    packages = [ ];
  };
  delphi_ls = {
    packages = [ ];
  };
  denols = {
    packages = [ deno ];
  };
  dhall_lsp_server = {
    packages = [ dhall-lsp-server ];
  };
  diagnosticls = {
    packages = [ diagnostic-languageserver ];
  };
  digestif = {
    packages = [ lua54Packages.digestif ];
  };
  djlsp = {
    packages = [ ];
  };
  docker_compose_language_service = {
    packages = [ docker-compose-language-service ];
  };
  dockerls = {
    packages = [ dockerfile-language-server-nodejs ];
  };
  dolmenls = {
    packages = [ ocamlPackages.dolmen_lsp ];
  };
  dotls = {
    packages = [ dot-language-server ];
  };
  dprint = {
    packages = [ dprint ];
  };
  drools_lsp = {
    packages = [ ];
  };
  ds_pinyin_lsp = {
    packages = [ ];
  };
  dts_lsp = {
    packages = [ ];
  };
  earthlyls = {
    packages = [ ];
  };
  ecsact = {
    packages = [ ];
  };
  efm = {
    packages = [ efm-langserver ];
  };
  elixirls = {
    packages = [
      elixir_ls
      beamPackages.hex
    ];
  };
  elmls = {
    packages = [ elmPackages.elm-language-server ];
  };
  elp = {
    packages = [ ];
  };
  ember = {
    packages = [ ember-language-server ];
  };
  emmet_language_server = {
    packages = [ ];
  };
  emmet_ls = {
    packages = [ ];
  };
  erg_language_server = {
    packages = [ ];
  };
  erlangls = {
    packages = [ erlang-ls ];
  };
  esbonio = {
    packages = [ ];
  };
  eslint = {
    packages = [
      vscode-langservers-extracted
      eslint
    ];
  };
  facility_language_server = {
    packages = [ ];
  };
  fennel_language_server = {
    packages = [ ];
  };
  fennel_ls = {
    packages = [ fennel-ls ];
  };
  fish_lsp = {
    packages = [ fish-lsp ];
  };
  flow = {
    packages = [ flow ];
  };
  flux_lsp = {
    packages = [ ];
  };
  foam_ls = {
    packages = [ ];
  };
  fortls = {
    packages = [ fortls ];
  };
  fsautocomplete = {
    packages = [ fsautocomplete ];
  };
  fsharp_language_server = {
    packages = [ ];
  };
  fstar = {
    packages = [ fstar ];
  };
  futhark_lsp = {
    packages = [ futhark ];
  };
  # This one does not even need any packages
  gdscript = {
    packages = [ ];
  };
  gdshader_lsp = {
    packages = [ ];
  };
  gh_actions_ls = {
    packages = [ ];
  };
  ghcide = {
    packages = [ ];
  };
  ghdl_ls = {
    packages = [ ];
  };
  ginko_ls = {
    packages = [ ];
  };
  gitlab_ci_ls = {
    packages = [ ];
  };
  glasgow = {
    packages = [ ];
  };
  gleam = {
    packages = [ gleam ];
  };
  glint = {
    packages = [ ];
  };
  glsl_analyzer = {
    packages = [ glsl_analyzer ];
  };
  glslls = {
    packages = [ glslls ];
  };
  golangci_lint_ls = {
    packages = [ ];
  };
  gopls = {
    packages = [
      gopls
      go
    ];
  };
  gradle_ls = {
    packages = [ ];
  };
  grammarly = {
    packages = [ ];
  };
  graphql = {
    packages = [ ];
  };
  groovyls = {
    packages = [ ];
  };
  guile_ls = {
    packages = [ ];
  };
  harper_ls = {
    packages = [ ];
  };
  haxe_language_server = {
    packages = [ ];
  };
  hdl_checker = {
    packages = [ ];
  };
  helm_ls = {
    packages = [ helm-ls ];
  };
  hhvm = {
    packages = [ ];
  };
  hie = {
    packages = [ ];
  };
  hlasm = {
    packages = [ ];
  };
  hls = {
    packages = [
      haskell-language-server
      ghc
    ];
  };
  hoon_ls = {
    packages = [ ];
  };
  html = {
    packages = [ vscode-langservers-extracted ];
  };
  htmx = {
    packages = [ htmx-lsp ];
  };
  hydra_lsp = {
    packages = [ ];
  };
  hyprls = {
    packages = [ hyprls ];
  };
  idris2_lsp = {
    packages = [ idris2Packages.idris2Lsp ];
  };
  intelephense = {
    packages = [ intelephense ];
  };
  janet_lsp = {
    packages = [ ];
  };
  java_language_server = {
    packages = [ java-language-server ];
  };
  jdtls = {
    packages = [ jdt-language-server ];
  };
  jedi_language_server = {
    packages = [ python3Packages.jedi-language-server ];
  };
  jinja_lsp = {
    packages = [ jinja-lsp ];
  };
  jqls = {
    packages = [ jq-lsp ];
  };
  jsonls = {
    packages = [ vscode-langservers-extracted ];
  };
  jsonnet_ls = {
    packages = [ jsonnet-language-server ];
  };
  julials = {
    packages = [ ];
  };
  just = {
    packages = [ ];
  };
  kcl = {
    packages = [ ];
  };
  koka = {
    packages = [ koka ];
  };
  kotlin_language_server = {
    packages = [ kotlin-language-server ];
  };
  kulala_ls = {
    packages = [ ];
  };
  laravel_ls = {
    packages = [ ];
  };
  lean3ls = {
    packages = [ ];
  };
  leanls = {
    packages = [ ];
  };
  lelwel_ls = {
    packages = [ ];
  };
  lemminx = {
    packages = [ ];
  };
  lexical = {
    packages = [ ];
  };
  lsp_ai = {
    packages = [ ];
  };
  ltex = {
    packages = [ ltex-ls ];
  };
  ltex_plus = {
    packages = [ ];
  };
  lua_ls = {
    packages = [ lua-language-server ];
  };
  luau_lsp = {
    packages = [ luau-lsp ];
  };
  lwc_ls = {
    packages = [ ];
  };
  m68k = {
    packages = [ ];
  };
  markdown_oxide = {
    packages = [ markdown-oxide ];
  };
  marko-js = {
    packages = [ ];
  };
  marksman = {
    packages = [ marksman ];
  };
  matlab_ls = {
    packages = [ matlab-language-server ];
  };
  mdx_analyzer = {
    packages = [ ];
  };
  mesonlsp = {
    packages = [ mesonlsp ];
  };
  metals = {
    packages = [
      metals
      jdk17
    ];
  };
  millet = {
    packages = [ millet ];
  };
  mint = {
    packages = [ mint ];
  };
  mlir_lsp_server = {
    packages = [ ];
  };
  mlir_pdll_lsp_server = {
    packages = [ ];
  };
  mm0_ls = {
    packages = [ ];
  };
  mojo = {
    packages = [ ];
  };
  motoko_lsp = {
    packages = [ ];
  };
  move_analyzer = {
    packages = [ ];
  };
  msbuild_project_tools_server = {
    packages = [ ];
  };
  muon = {
    packages = [ ];
  };
  mutt_ls = {
    packages = [ ];
  };
  nelua_lsp = {
    packages = [ ];
  };
  neocmake = {
    packages = [ ];
  };
  nextflow_ls = {
    packages = [ ];
  };
  nextls = {
    packages = [ ];
  };
  nginx_language_server = {
    packages = [ nginx-language-server ];
  };
  nickel_ls = {
    packages = [ nls ];
  };
  nil_ls = {
    packages = [ nil ];
  };
  nim_langserver = {
    packages = [ nimlangserver ];
  };
  nimls = {
    packages = [ nimlsp ];
  };
  nixd = {
    packages = [ nixd ];
  };
  nomad_lsp = {
    packages = [ ];
  };
  ntt = {
    packages = [ ];
  };
  nushell = {
    packages = [ nushell ];
  };
  nxls = {
    packages = [ ];
  };
  ocamllsp = {
    packages = [ ocamlPackages.ocaml-lsp ];
  };
  ols = {
    packages = [ ];
  };
  omnisharp = {
    packages = [
      omnisharp-roslyn
      dotnet-sdk
    ];
  };
  opencl_ls = {
    packages = [ ];
  };
  openedge_ls = {
    packages = [ ];
  };
  openscad_ls = {
    packages = [ ];
  };
  openscad_lsp = {
    packages = [ openscad-lsp ];
  };
  oxlint = {
    packages = [ oxlint ];
  };
  pact_ls = {
    packages = [ ];
  };
  pasls = {
    packages = [ ];
  };
  pbls = {
    packages = [ ];
  };
  perlls = {
    packages = [
      perlPackages.PerlLanguageServer
      perl
    ];
  };
  perlnavigator = {
    packages = [
      perlnavigator
      perl
    ];
  };
  perlpls = {
    packages = [ perlPackages.PLS ];
  };
  pest_ls = {
    packages = [ ];
  };
  phan = {
    packages = [ ];
  };
  phpactor = {
    packages = [ phpactor ];
  };
  pico8_ls = {
    packages = [ ];
  };
  pkgbuild_language_server = {
    packages = [ ];
  };
  please = {
    packages = [ ];
  };
  poryscript_pls = {
    packages = [ ];
  };
  postgres_lsp = {
    packages = [ postgres-lsp ];
  };
  powershell_es = {
    packages = [ powershell ];
  };
  prismals = {
    packages = [ nodePackages."@prisma/language-server" ];
  };
  prolog_ls = {
    packages = [ ];
  };
  prosemd_lsp = {
    packages = [ ];
  };
  protols = {
    packages = [ protols ];
  };
  psalm = {
    packages = [ phpPackages.psalm ];
  };
  pug = {
    packages = [ ];
  };
  puppet = {
    packages = [ ];
  };
  purescriptls = {
    packages = [ nodePackages.purescript-language-server ];
  };
  pylsp = {
    packages = [ python3Packages.python-lsp-server ];
  };
  pylyzer = {
    packages = [ pylyzer ];
  };
  pyre = {
    packages = [ ];
  };
  pyright = {
    packages = [ pyright ];
  };
  qmlls = {
    packages = [ kdePackages.qtdeclarative ];
  };
  quick_lint_js = {
    packages = [ quick-lint-js ];
  };
  r_language_server = {
    packages = [ rPackages.languageserver ];
  };
  racket_langserver = {
    packages = [ ];
  };
  raku_navigator = {
    packages = [ ];
  };
  reason_ls = {
    packages = [ ];
  };
  regal = {
    packages = [ regal ];
  };
  regols = {
    packages = [ regols ];
  };
  relay_lsp = {
    packages = [ ];
  };
  remark_ls = {
    packages = [ ];
  };
  rescriptls = {
    packages = [ ];
  };
  rls = {
    packages = [ ];
  };
  robotcode = {
    packages = [ ];
  };
  robotframework_ls = {
    packages = [ ];
  };
  roc_ls = {
    packages = [ ];
  };
  rpmspec = {
    packages = [ ];
  };
  rubocop = {
    packages = [ ];
  };
  ruby_lsp = {
    packages = [
      rubyPackages.ruby-lsp
      bundler
    ];
  };
  ruff = {
    packages = [ ruff ];
  };
  rune_languageserver = {
    packages = [ rune-languageserver ];
  };
  rust_analyzer = {
    packages = [
      rust-analyzer
      cargo
      rustc
      rustfmt
    ];
  };
  salt_ls = {
    packages = [ ];
  };
  scheme_langserver = {
    packages = [ akkuPackages.scheme-langserver ];
  };
  scry = {
    packages = [ scry ];
  };
  selene3p_ls = {
    packages = [ ];
  };
  serve_d = {
    packages = [ ];
  };
  shopify_theme_ls = {
    packages = [ ];
  };
  sixtyfps = {
    packages = [ ];
  };
  slangd = {
    packages = [ ];
  };
  slint_lsp = {
    packages = [ slint-lsp ];
  };
  smarty_ls = {
    packages = [ ];
  };
  smithy_ls = {
    packages = [ ];
  };
  snakeskin_ls = {
    packages = [ ];
  };
  snyk_ls = {
    packages = [ ];
  };
  solang = {
    packages = [ ];
  };
  solargraph = {
    packages = [ rubyPackages.solargraph ];
  };
  solc = {
    packages = [ solc ];
  };
  solidity = {
    packages = [ ];
  };
  solidity_ls = {
    packages = [ ];
  };
  solidity_ls_nomicfoundation = {
    packages = [ ];
  };
  somesass_ls = {
    packages = [ ];
  };
  sorbet = {
    packages = [ ];
  };
  sourcekit = {
    packages = [ sourcekit-lsp ];
  };
  sourcery = {
    packages = [ ];
  };
  spectral = {
    packages = [ ];
  };
  spyglassmc_language_server = {
    packages = [ (fp inputs.spyglassmc) ];
  };
  sqlls = {
    packages = [ ];
  };
  standardrb = {
    packages = [ rubyPackages.standard ];
  };
  starlark_rust = {
    packages = [ ];
  };
  starpls = {
    packages = [ ];
  };
  statix = {
    packages = [ ];
  };
  steep = {
    packages = [ ];
  };
  stimulus_ls = {
    packages = [ ];
  };
  stylelint_lsp = {
    packages = [ stylelint-lsp ];
  };
  stylua3p_ls = {
    packages = [ ];
  };
  superhtml = {
    packages = [ ];
  };
  svelte = {
    packages = [ svelte-language-server ];
  };
  svlangserver = {
    packages = [ ];
  };
  svls = {
    packages = [ svls ];
  };
  swift_mesonls = {
    packages = [ ];
  };
  syntax_tree = {
    packages = [ rubyPackages.syntax_tree ];
  };
  systemd_ls = {
    packages = [ systemd-lsp ];
  };
  tabby_ml = {
    packages = [ ];
  };
  tailwindcss = {
    packages = [ tailwindcss-language-server ];
  };
  taplo = {
    packages = [ taplo-lsp ];
  };
  tblgen_lsp_server = {
    packages = [ ];
  };
  teal_ls = {
    packages = [ luajitPackages.teal-language-server ];
  };
  templ = {
    packages = [ ];
  };
  terraform_lsp = {
    packages = [ terraform-lsp ];
  };
  terraformls = {
    packages = [ terraform-ls ];
  };
  texlab = {
    packages = [ texlab ];
  };
  textlsp = {
    packages = [ ];
  };
  tflint = {
    packages = [ tflint ];
  };
  theme_check = {
    packages = [ ];
  };
  thriftls = {
    packages = [ thrift-ls ];
  };
  tilt_ls = {
    packages = [ tilt ];
  };
  tinymist = {
    packages = [ tinymist ];
  };
  ts_ls = {
    packages = [
      typescript-language-server
      typescript
    ];
  };
  ts_query_ls = {
    packages = [ ts_query_ls ];
  };
  tsp_server = {
    packages = [ ];
  };
  ttags = {
    packages = [ ];
  };
  turbo_ls = {
    packages = [ ];
  };
  turtle_ls = {
    packages = [ ];
  };
  tvm_ffi_navigator = {
    packages = [ ];
  };
  twiggy_language_server = {
    packages = [ ];
  };
  typeprof = {
    packages = [ ];
  };
  typos_lsp = {
    packages = [ ];
  };
  uiua = {
    packages = [ ];
  };
  ungrammar_languageserver = {
    packages = [ ];
  };
  unison = {
    packages = [ ];
  };
  unocss = {
    packages = [ ];
  };
  uvls = {
    packages = [ ];
  };
  v_analyzer = {
    packages = [ ];
  };
  vacuum = {
    packages = [ ];
  };
  vala_ls = {
    packages = [ vala-language-server ];
  };
  vale_ls = {
    packages = [ ];
  };
  vdmj = {
    packages = [ ];
  };
  vectorcode_server = {
    packages = [ ];
  };
  verible = {
    packages = [ verible ];
  };
  veridian = {
    packages = [ ];
  };
  veryl_ls = {
    packages = [ ];
  };
  vhdl_ls = {
    packages = [ vhdl-ls ];
  };
  vimls = {
    packages = [ vim-language-server ];
  };
  visualforce_ls = {
    packages = [ ];
  };
  vls = {
    packages = [ vlang ];
  };
  vue_ls = {
    packages = [ vue-language-server ];
    config = ''
      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = "${vue-language-server}/lib/language-tools/packages/language-server",
        languages = { "vue" },
        configNamespace = "typescript",
      }

      local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

      vim.lsp.config("vtsls", {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = tsserver_filetypes,
      })

      vim.lsp.config("ts_ls", {
        init_options = {
          plugins = {
            vue_plugin,
          },
        },
        filetypes = tsserver_filetypes,
      })
    '';
  };
  vscoqtop = {
    packages = [ ];
  };
  vtsls = {
    packages = [
      vtsls
      typescript
    ];
  };
  wasm_language_tools = {
    packages = [ ];
  };
  wgsl_analyzer = {
    packages = [ ];
  };
  yamlls = {
    packages = [ yaml-language-server ];
  };
  yang_lsp = {
    packages = [ ];
  };
  yls = {
    packages = [ ];
  };
  ziggy = {
    packages = [ ];
  };
  ziggy_schema = {
    packages = [ ];
  };
  zk = {
    packages = [ zk ];
  };
  zls = {
    packages = [ zls ];
  };
}
