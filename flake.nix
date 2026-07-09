{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    spyglassmc = {
      url = "github:Tomate0613/nix-flakes/spyglassmc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { ... }@inputs:
    {
      homeModules.default = import ./hm.nix { inherit inputs; };
    };
}
