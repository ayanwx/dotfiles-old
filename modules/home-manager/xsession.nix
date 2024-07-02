{ pkgs, settings, ... }:
{
  xsession = {
    enable = true;
    initExtra = "${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --mode ${settings.xrandr_resolution} --rate ${settings.xrandr_refreshrate}";
    windowManager = {
      bspwm = {
        enable = true;
        monitors = {
          HDMI-1 = [
            "1"
            "2"
            "3"
            "4"
            "5"
          ];
        };
        settings = {
          border_width = 2;
          window_gap = 7;
          split_ratio = 0.5;
          borderless_monocle = true;
          gapless_monocle = true;
          normal_border_color = "#16161e";
          focused_border_color = "#16161e";
        };
        extraConfigEarly = "pgrep -x sxhkd > /dev/null || sxhkd &";
        extraConfig = ''
          eww open leftbar --restart --config /home/ayanw/.config/eww/windows/leftbar &
          eww open startmenu --restart --config /home/ayanw/.config/eww/windows/startmenu
        '';
        rules = {
          Thunar = {
            state = "floating";
            follow = true;
          };
        };
      };
    };
  };
}
