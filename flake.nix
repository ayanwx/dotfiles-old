{
  description = "AyanW's Nix Flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations."inductionCooker" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./base.nix
          ./hardware-configuration.nix

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
