{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode
    neovide # gui for nvim
    blender
    godot_4
  ];
}
