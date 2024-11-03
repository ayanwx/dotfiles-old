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
          systemctl --user import-environment PATH &
          systemctl --user restart xdg-desktop-portal.service &
          xset -dpms &
          xset s off
        '';
        rules = {
          Thunar = {
            state = "floating";
            follow = true;
          };
          gcolor3 = {
            state = "floating";
            follow = true;
          };
          qbittorrent = {
            state = "floating";
            follow = true;
          };
          Emulator = {
            state = "floating";
            follow = true;
          };
          "An Anime Game Launcher" = {
            state = "floating";
            follow = true;
          };
          "jetbrains-studio" = {
            state = "floating";
            follow = true;
          };

        };
      };
    };
  };
}
