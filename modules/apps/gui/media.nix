{ pkgs, settings, ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = settings.username;
  };

  environment.systemPackages = with pkgs; [
    spotify
    vlc
    mpv
    playerctl
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
