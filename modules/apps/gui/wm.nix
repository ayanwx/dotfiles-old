{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    eww # widgets
    kitty # terminal emulator
    rofi # app launcher
    dunst # notifications
    maim # screenshots
    #feh # image viewer, wallpaper # -> services.feh
    pavucontrol # pulseaudio volume control
    lxappearance # gtk theming
    xfce.tumbler # thumbnails for thunar
    xfce.thunar
    gparted
    sxhkd
  ];
}
