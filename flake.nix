{
  description = "AyanW's Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:

    let
      settings = import ./settings.nix;
    in
    {
      nixosConfigurations = {
        ${settings.hostname} = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit settings;
          };
          modules = [
            ./required/configuration.nix

            ./modules/boot
            ./modules/locale
            ./modules/services
            ./modules/xserver
            ./modules/fonts
            ./modules/sound
            ./modules/apps
          ];
          system = settings.system;
        };
      };

      homeConfigurations = {
        ${settings.username} = home-manager.lib.homeManagerConfiguration {
          specialArgs = {
            inherit settings;
          };
          modules = [ ./required/home.nix ];
        };
      };
    };
}
