{
  config,
  pkgs,
  lib,
  settings,
  inputs,
  ...
}:
{

  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = settings.hostname;
  networking.networkmanager.enable = true;
  time.timeZone = settings.timezone;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit settings;
    };
    users.${settings.username} = {
      imports = [
        ./home.nix
        inputs.catppuccin.homeManagerModules.catppuccin
      ];
    };
    backupFileExtension = "backup";
  };

  programs.git = {
    enable = true;
    config = {
      init.defaultbranch = "main";
    };
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";
}
