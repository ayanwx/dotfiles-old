{
  config,
  pkgs,
  lib,
  settings,
  ...
}:
{

  imports = [ ./hardware-configuration.nix ];

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

  programs.git = {
    enable = true;
    config = {
      init.defaultbranch = "main";
    };
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";
}
