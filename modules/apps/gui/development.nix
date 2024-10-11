{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode
    zed-editor
    #neovide # gui for nvim
    blender
    godot_4
    aseprite
    android-studio
    android-tools
    #figma-linux
  ];
}
