{ settings, ... }:
{
  home.file = {
    ".config/fish/fish_variables".source = ../../../config/fish/fish_variables;
    ".config/sxhkd/scripts/take-screenshot.fish".source = ../../../config/sxhkd/scripts/take-screenshot.fish;
    ".config/neofetch/config.conf".source = ../../../config/neofetch/config.conf;
    ".config/picom/picom.conf".source = ../../../config/picom/picom.conf;
    ".config/rofi/config.rasi".source = ../../../config/rofi/config.rasi;
    ".config/rofi/theme/colors.rasi".source = ../../../config/rofi/theme/colors.rasi;
    ".config/rofi/theme/elements.rasi".source = ../../../config/rofi/theme/elements.rasi;
  };
}
