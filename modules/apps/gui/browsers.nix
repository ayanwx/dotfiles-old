{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition; # developer edition for webdev tools
  };

  environment.systemPackages = with pkgs; [
    #vivaldi
    floorp
  ];
}
