{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spotify
    vlc
    playerctl
  ];
}
