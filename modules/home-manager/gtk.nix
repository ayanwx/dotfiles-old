{ pkgs, ... }:
{

  gtk = {
    enable = true;
    font = {
      package = pkgs.nerdfonts;
      name = "FantasqueSansM Nerd Font";
      size = 10;
    };
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "blue";
      icon = {
        enable = true;
        accent = "blue";
      };
    };
  };
}
