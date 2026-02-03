{
  description = "pnpm to nix";

  outputs =
    { ... }:
    {
      overlays.default = final: prev: {
        mkPnpmPackage = (prev.callPackage ./derivation.nix);
      };
    };
}
