{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerdfonts;
      name = "FantasqueSansM Nerd Font";
      size = 12;
    };
    extraConfig = ''
      foreground #a9b1d6
      background #16161E

      # Black
      color0 #414868
      color8 #414868

      # Red
      color1 #F16399
      color9 #f7768e

      # Green
      color2  #18FFB1
      color10 #73daca

      # Yellow
      color3  #FFD493
      color11 #e0af68

      # Blue
      color4  #42A5F5
      color12 #7aa2f7

      # Magenta
      color5  #7353F8
      color13 #bb9af7

      # Cyan
      color6  #7dcfff
      color14 #7dcfff

      # White
      color7  #c0caf5
      color15 #c0caf5


      modify_font underline_position 2
      modify_font underline_thickness 70%


      cursor #a9b1d6
      cursor_blink_interval 0
      window_padding_width 5
      cursor_shape beam
    '';
  };
}
