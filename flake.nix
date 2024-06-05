{
  description = "AyanW's Nix Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:

    let
      settings = import ./settings.nix;
    in
    {
      nixosConfigurations.${settings.hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit settings;
        };
        system = settings.system;
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
