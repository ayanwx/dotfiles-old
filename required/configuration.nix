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

  networking = {
    hostName = settings.hostname;
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 1000;
          to = 9999;
        }
      ];
    };
  };
  time.timeZone = settings.timezone;
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://ezkea.cachix.org" ];
    trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
  };

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
        ../modules/home-manager
        inputs.catppuccin.homeManagerModules.catppuccin
      ];
    };
    backupFileExtension = "backup";
  };

  programs = {
    git = {
      enable = true;
      config = {
        init.defaultbranch = "main";
      };
    };
    nix-ld.enable = true;
    anime-game-launcher.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";
}
