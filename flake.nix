{
  description = "AyanW's Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      catppuccin,
      home-manager,
      aagl,
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
            inherit inputs;
          };

          modules = [

            ./required/configuration.nix

            ./modules/boot # bootloader settings
            ./modules/locale # locale settings
            ./modules/services # systemd services
            ./modules/xserver # xorg-xserver
            ./modules/xdg # xdg desktop portals
            ./modules/fonts # fonts & nerd fonts
            ./modules/sound # sound settings
            ./modules/apps # apps, modularized into cli & gui

            {
              imports = [ aagl.nixosModules.default ];
              nix.settings = aagl.nixConfig;
            }
          ];
          system = settings.system;
        };
      };
    };
}
