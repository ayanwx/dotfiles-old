{ pkgs, ... }:
{
  programs.fish.enable = true; # fish shell
  programs.direnv.enable = true;
  programs.nh.enable = true;
  services.flatpak.enable = true;

  imports = [
    ./cli
    ./gui
  ];

  environment.systemPackages = with pkgs; [
    micro # editor
    wget # downloader
    neofetch # most important
  ];
}
