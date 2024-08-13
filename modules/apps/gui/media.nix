{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spotify
    vlc
    mpv
    playerctl
  ];
}
