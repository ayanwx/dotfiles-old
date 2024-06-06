{ pkgs, ... }:
{
  programs.fish.enable = true; # fish shell

  services.flatpak.enable = true;

  imports = [

    ./cli/utilities.nix
    ./cli/development.nix

    ./gui/wm.nix
    ./gui/browsers.nix
    ./gui/development.nix
    ./gui/media.nix
    ./gui/torrent.nix
  ];

  environment.systemPackages = with pkgs; [
    micro # editor
    wget # downloader
    neofetch # most important
  ];
}
