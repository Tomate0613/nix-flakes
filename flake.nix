{
  inputs = {
    mango = {
      url = "github:mangowm/mango";
    };
  };

  outputs = { self, mango }: {
    homeManagerModules = {
      default = import ./nix/hm-modules.nix mango;
      mango = self.homeManagerModules.default;
    };
  };
}
