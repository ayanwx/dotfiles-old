{ config, pkgs, lib, ... }: {

  networking.hostName = "inductionCooker";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Dhaka";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.ayanw = {
    isNormalUser = true;
    description = "AyanW";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [];
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
