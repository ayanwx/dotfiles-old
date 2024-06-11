{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nodePackages."nodemon"
    nodePackages."prettier"
    nodePackages."neovim"
  ];
}
