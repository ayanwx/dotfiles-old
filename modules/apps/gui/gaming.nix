{ pkgs, ... }:
{
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    wine
    dxvk
    jdk21
  ];
}
