{ pkgs, ... }:
{
  programs.fish.enable = true; # fish shell

  services.flatpak.enable = true;

  imports = [
    ./cli
    ./gui
  ];

  environment.systemPackages = with pkgs; [
    micro # editor
    wget # downloader
    neofetch # most important
    home-manager
  ];
}
