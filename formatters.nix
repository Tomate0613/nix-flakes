{ inputs, system }:
let
  pkgs = inputs.nixpkgs.legacyPackages."${system}";
  fp = input: input.package."${system}".default;
in
with pkgs;
{
  air = {
    command = "${air-formatter}/bin/air";
  };
  alejandra = {
    command = "${alejandra}/bin/alejandra";
  };
  ansible-lint = {
    command = "${ansible-lint}/bin/ansible-lint";
  };
  asmfmt = {
    command = "${asmfmt}/bin/asmfmt";
  };
  ast-grep = {
    command = "${ast-grep}/bin/ast-grep";
  };
  astyle = {
    command = "${astyle}/bin/astyle";
  };
  autocorrect = {
    command = "${autocorrect}/bin/autocorrect";
  };
  autoflake = {
    command = "${autoflake}/bin/autoflake";
  };
  auto_optional = {
    command = "";
  };
  autopep8 = {
    command = "";
  };
  awk = {
    command = "${gawk}/bin/awk";
  };
  bake = {
    command = "";
  };
  bean-format = {
    command = "";
  };
  beautysh = {
    command = "";
  };
  bibtex-tidy = {
    command = "";
  };
  bicep = {
    command = "";
  };
  biome = {
    command = "";
  };
  biome-check = {
    command = "";
  };
  biome-organize-imports = {
    command = "";
  };
  black = {
    command = "";
  };
  blade-formatter = {
    command = "";
  };
  blue = {
    command = "";
  };
  bpfmt = {
    command = "";
  };
  bsfmt = {
    command = "";
  };
  buf = {
    command = "";
  };
  buildifier = {
    command = "";
  };
  cabal_fmt = {
    command = "";
  };
  caramel_fmt = {
    command = "";
  };
  cbfmt = {
    command = "";
  };
  cedar = {
    command = "";
  };
  clang-format = {
    command = "";
  };
  clang_format = {
    command = "";
  };
  cljfmt = {
    command = "";
  };
  cljstyle = {
    command = "";
  };
  cmake_format = {
    command = "";
  };
  codeql = {
    command = "";
  };
  codespell = {
    command = "";
  };
  commitmsgfmt = {
    command = "";
  };
  crlfmt = {
    command = "";
  };
  crystal = {
    command = "";
  };
  csharpier = {
    command = "";
  };
  css_beautify = {
    command = "";
  };
  cue_fmt = {
    command = "";
  };
  d2 = {
    command = "";
  };
  darker = {
    command = "";
  };
  dart_format = {
    command = "";
  };
  dcm_fix = {
    command = "";
  };
  dcm_format = {
    command = "";
  };
  deno_fmt = {
    command = "";
  };
  dfmt = {
    command = "";
  };
  dioxus = {
    command = "";
  };
  djlint = {
    command = "";
  };
  docformatter = {
    command = "";
  };
  dockerfmt = {
    command = "";
  };
  docstrfmt = {
    command = "";
  };
  doctoc = {
    command = "";
  };
  dprint = {
    command = "";
  };
  easy-coding-standard = {
    command = "";
  };
  efmt = {
    command = "";
  };
  elm_format = {
    command = "";
  };
  erb_format = {
    command = "";
  };
  erlfmt = {
    command = "";
  };
  eslint_d = {
    command = "";
  };
  fantomas = {
    command = "";
  };
  findent = {
    command = "";
  };
  fish_indent = {
    command = "";
  };
  fixjson = {
    command = "";
  };
  fnlfmt = {
    command = "";
  };
  forge_fmt = {
    command = "";
  };
  format-dune-file = {
    command = "";
  };
  format-queries = {
    command = "";
  };
  fourmolu = {
    command = "";
  };
  fprettify = {
    command = "";
  };
  gawk = {
    command = "";
  };
  gci = {
    command = "";
  };
  gdformat = {
    command = "${gdtoolkit_4}/bin/gdformat";
  };
  gdscript-formatter = {
    command = "";
  };
  gersemi = {
    command = "";
  };
  ghdl = {
    command = "";
  };
  ghokin = {
    command = "";
  };
  gleam = {
    command = "${gleam}/bin/gleam";
  };
  gluon_fmt = {
    command = "";
  };
  gn = {
    command = "";
  };
  gofmt = {
    command = "";
  };
  gofumpt = {
    command = "";
  };
  goimports = {
    command = "";
  };
  goimports-reviser = {
    command = "";
  };
  gojq = {
    command = "";
  };
  golangci-lint = {
    command = "";
  };
  golines = {
    command = "";
  };
  google-java-format = {
    command = "";
  };
  grain_format = {
    command = "";
  };
  hcl = {
    command = "";
  };
  hindent = {
    command = "";
  };
  hledger-fmt = {
    command = "";
  };
  htmlbeautifier = {
    command = "";
  };
  html_beautify = {
    command = "";
  };
  hurlfmt = {
    command = "";
  };
  imba_fmt = {
    command = "";
  };
  indent = {
    command = "";
  };
  init = {
    command = "";
  };
  injected = {
    command = "";
  };
  inko = {
    command = "";
  };
  isort = {
    command = "";
  };
  janet-format = {
    command = "";
  };
  joker = {
    command = "";
  };
  jq = {
    command = "";
  };
  js_beautify = {
    command = "";
  };
  jsonnetfmt = {
    command = "";
  };
  json_repair = {
    command = "";
  };
  just = {
    command = "";
  };
  kcl = {
    command = "";
  };
  kdlfmt = {
    command = "";
  };
  keep-sorted = {
    command = "";
  };
  ktfmt = {
    command = "";
  };
  ktlint = {
    command = "";
  };
  kulala-fmt = {
    command = "";
  };
  latexindent = {
    command = "";
  };
  leptosfmt = {
    command = "";
  };
  liquidsoap-prettier = {
    command = "";
  };
  llf = {
    command = "";
  };
  lua-format = {
    command = "";
  };
  mago_format = {
    command = "";
  };
  mago_lint = {
    command = "";
  };
  markdownfmt = {
    command = "";
  };
  markdownlint = {
    command = "";
  };
  markdownlint-cli2 = {
    command = "";
  };
  markdown-toc = {
    command = "";
  };
  mdformat = {
    command = "";
  };
  mdsf = {
    command = "";
  };
  mdslw = {
    command = "";
  };
  meson = {
    command = "";
  };
  mh_style = {
    command = "";
  };
  mix = {
    command = "";
  };
  mojo_format = {
    command = "";
  };
  nginxfmt = {
    command = "";
  };
  nickel = {
    command = "";
  };
  nimpretty = {
    command = "";
  };
  nixfmt = {
    command = "${nixfmt}/bin/nixfmt";
  };
  nixpkgs_fmt = {
    command = "";
  };
  nomad_fmt = {
    command = "";
  };
  nph = {
    command = "";
  };
  npm-groovy-lint = {
    command = "";
  };
  nufmt = {
    command = "";
  };
  ocamlformat = {
    command = "";
  };
  ocp-indent = {
    command = "";
  };
  odinfmt = {
    command = "";
  };
  opa_fmt = {
    command = "";
  };
  openapi_format = {
    command = "";
  };
  ormolu = {
    command = "";
  };
  oxfmt = {
    command = "";
  };
  oxlint = {
    command = "";
  };
  packer_fmt = {
    command = "";
  };
  palantir-java-format = {
    command = "";
  };
  panache = {
    command = "";
  };
  panache-fix = {
    command = "";
  };
  pangu = {
    command = "";
  };
  pasfmt = {
    command = "";
  };
  perlimports = {
    command = "";
  };
  perltidy = {
    command = "";
  };
  pg_format = {
    command = "";
  };
  phpcbf = {
    command = "";
  };
  php_cs_fixer = {
    command = "";
  };
  phpinsights = {
    command = "";
  };
  pint = {
    command = "";
  };
  pkl = {
    command = "";
  };
  prettier = {
    command = "";
  };
  prettierd = {
    command = "${prettierd}/bin/prettierd";
  };
  pretty-php = {
    command = "";
  };
  prettypst = {
    command = "";
  };
  prolog = {
    command = "";
  };
  pruner = {
    command = "";
  };
  puppet-lint = {
    command = "";
  };
  purs-tidy = {
    command = "";
  };
  pycln = {
    command = "";
  };
  pyink = {
    command = "";
  };
  pymarkdownlnt = {
    command = "";
  };
  pyproject-fmt = {
    command = "";
  };
  python-ly = {
    command = "";
  };
  pyupgrade = {
    command = "";
  };
  qmlformat = {
    command = "";
  };
  racketfmt = {
    command = "";
  };
  reformat-gherkin = {
    command = "";
  };
  reorder-python-imports = {
    command = "";
  };
  rescript-format = {
    command = "";
  };
  roc = {
    command = "";
  };
  rstfmt = {
    command = "";
  };
  rubocop = {
    command = "";
  };
  rubyfmt = {
    command = "";
  };
  ruff = {
    command = "";
  };
  ruff_fix = {
    command = "";
  };
  ruff_format = {
    command = "";
  };
  ruff_organize_imports = {
    command = "";
  };
  rufo = {
    command = "";
  };
  rumdl = {
    command = "";
  };
  runic = {
    command = "";
  };
  rustfmt = {
    command = "";
  };
  rustywind = {
    command = "";
  };
  scalafmt = {
    command = "";
  };
  shellcheck = {
    command = "";
  };
  shellharden = {
    command = "";
  };
  shfmt = {
    command = "";
  };
  sleek = {
    command = "";
  };
  smlfmt = {
    command = "";
  };
  snakefmt = {
    command = "";
  };
  spotless_gradle = {
    command = "";
  };
  spotless_maven = {
    command = "";
  };
  sqlfluff = {
    command = "";
  };
  sqlfmt = {
    command = "";
  };
  sql_formatter = {
    command = "";
  };
  sqruff = {
    command = "";
  };
  squeeze_blanks = {
    command = "";
  };
  standard-clj = {
    command = "";
  };
  standardjs = {
    command = "";
  };
  standardrb = {
    command = "";
  };
  stylelint = {
    command = "";
  };
  styler = {
    command = "";
  };
  stylish-haskell = {
    command = "";
  };
  stylua = {
    command = "${stylua}/bin/stylua";
  };
  superhtml = {
    command = "";
  };
  swift = {
    command = "";
  };
  swift_format = {
    command = "";
  };
  swiftformat = {
    command = "";
  };
  swiftlint = {
    command = "";
  };
  syntax_tree = {
    command = "";
  };
  taplo = {
    command = "";
  };
  tclfmt = {
    command = "";
  };
  templ = {
    command = "";
  };
  terraform_fmt = {
    command = "";
  };
  terragrunt_hclfmt = {
    command = "";
  };
  tex-fmt = {
    command = "";
  };
  tlint = {
    command = "";
  };
  tofu_fmt = {
    command = "";
  };
  tombi = {
    command = "";
  };
  treefmt = {
    command = "";
  };
  trim_newlines = {
    command = "";
  };
  trim_whitespace = {
    command = "";
  };
  trunk = {
    command = "";
  };
  twig-cs-fixer = {
    command = "";
  };
  txtpbfmt = {
    command = "";
  };
  typespec = {
    command = "";
  };
  typos = {
    command = "";
  };
  typstfmt = {
    command = "";
  };
  typstyle = {
    command = "";
  };
  ufmt = {
    command = "";
  };
  uncrustify = {
    command = "";
  };
  usort = {
    command = "";
  };
  v = {
    command = "";
  };
  verible = {
    command = "";
  };
  vsg = {
    command = "";
  };
  xmlformat = {
    command = "";
  };
  xmlformatter = {
    command = "";
  };
  xmllint = {
    command = "";
  };
  xmlstarlet = {
    command = "";
  };
  yamlfix = {
    command = "";
  };
  yamlfmt = {
    command = "";
  };
  yapf = {
    command = "";
  };
  yew-fmt = {
    command = "";
  };
  yq = {
    command = "";
  };
  zigfmt = {
    command = "";
  };
  ziggy = {
    command = "";
  };
  ziggy_schema = {
    command = "";
  };
  zprint = {
    command = "";
  };
}
