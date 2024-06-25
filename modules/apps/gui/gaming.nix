{ pkgs, ... }:
{

  imports = [ ../../overlays/prismlauncher.nix ];

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    lutris
    jdk21
    prismlauncher
    xclicker
  ];
}
