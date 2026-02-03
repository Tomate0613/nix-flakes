{ lockFile, pkgs }:

let
  pnpmLockJson =
    file:
    if builtins.pathExists file then
      pkgs.runCommand "pnpm-lock.json" { } ''
        ${pkgs.yq-go}/bin/yq -o=json ${file} > $out
      ''
    else
      throw "pnpm-lock.yaml file does not exist: ${file}";

  rawJson = builtins.readFile (pnpmLockJson lockFile);
in
builtins.fromJSON rawJson
