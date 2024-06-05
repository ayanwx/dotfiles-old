{
  description = "AyanW's Nix Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations."inductionCooker" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix

          ./modules/boot
          ./modules/locale
          ./modules/services
          ./modules/xserver
          ./modules/fonts
          ./modules/sound
          ./modules/apps
        ];
      };
    };
}
