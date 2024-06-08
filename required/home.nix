{
  config,
  settings,
  pkgs,
  ...
}:
{
  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";

  home.file = {
    ".config/fish/fish_variables".source = ../config/fish/fish_variables;
    ".config/sxhkd/scripts/take-screenshot.fish".source = ../config/sxhkd/scripts/take-screenshot.fish;
  };

  programs = {
    fish = {
      enable = true;
      shellAliases = {
        ls = "eza --icons auto";
        tree = "eza --tree --icons auto";
        du = "dust";
        cat = "bat --theme base16 --paging never -p";
        icat = "kitty icat";
        fucking = "sudo";
      };
      functions = {
        fish_greeting = {
          body = "clear && neofetch";
        };
      };
    };

    kitty = {
      enable = true;
      font = {
        package = pkgs.nerdfonts;
        name = "FantasqueSansM Nerd Font";
        size = 12;
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
    };

    eww = {
      enable = true;
      configDir = ../config/eww;
    };
  };

  services = {
    sxhkd = {
      enable = true;
      extraConfig = ''
        #!/usr/bin/env sh

        super + Return
        	kitty

        # program launcher
        super + @space
        	rofi -show

        super + shift + c
        	gpick

        super + shift + s
        	fish $HOME/.config/sxhkd/scripts/take-screenshot.fish

        super + shift + e
        	rofi -modi emoji -show emoji

        # make sxhkd reload its configuration files:
        super + Escape
        	pkill -USR1 -x sxhkd

        #
        # bspwm hotkeys
        #

        # quit/restart bspwm
        super + alt + {q,r}
        	bspc {quit,wm -r}

        # close and kill
        super + {_,shift + }q
        	bspc node -{c,k}

        # alternate between the tiled and monocle layout
        super + m
        	bspc desktop -l next

        # send the newest marked node to the newest preselected node
        super + y
        	bspc node newest.marked.local -n newest.!automatic.local

        # swap the current node and the biggest window
        super + g
        	bspc node -s biggest.window

        #
        # state/flags
        #

        # set the window state
        super + {t,shift + t,s,f}
        	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

        # set the node flags
        super + ctrl + {m,x,y,z}
        	bspc node -g {marked,locked,sticky,private}

        #
        # focus/swap
        #

        # focus the node in the given direction
        super + {_,shift + }{h,j,k,l}
        	bspc node -{f,s} {west,south,north,east}

        # focus the node for the given path jump
        super + {p,b,comma,period}
        	bspc node -f @{parent,brother,first,second}

        # focus the next/previous window in the current desktop
        super + {_,shift + }c
        	bspc node -f {next,prev}.local.!hidden.window

        # focus the next/previous desktop in the current monitor
        super + bracket{left,right}
        	bspc desktop -f {prev,next}.local

        # focus the last node/desktop
        super + {grave,Tab}
        	bspc {node,desktop} -f last

        # focus the older or newer node in the focus history
        super + {o,i}
        	bspc wm -h off; \
        	bspc node {older,newer} -f; \
        	bspc wm -h on

        # focus or send to the given desktop
        super + {_,shift + }{1-9,0}
        	bspc {desktop -f,node -d} '^{1-9,10}'

        #
        # preselect
        #

        # preselect the direction
        super + ctrl + {h,j,k,l}
        	bspc node -p {west,south,north,east}

        # preselect the ratio
        super + ctrl + {1-9}
        	bspc node -o 0.{1-9}

        # cancel the preselection for the focused node
        super + ctrl + space
        	bspc node -p cancel

        # cancel the preselection for the focused desktop
        super + ctrl + shift + space
        	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

        #
        # move/resize
        #

        # expand a window by moving one of its side outward
        super + alt + {h,j,k,l}
        	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

        # contract a window by moving one of its side inward
        super + alt + shift + {h,j,k,l}
        	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

        # move a floating window
        super + {Left,Down,Up,Right}
        	bspc node -v {-20 0,0 20,0 -20,20 0}

      '';
    };
  };

  xsession = {
    enable = true;
    initExtra = "${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --mode 1920x1080 --rate 75";
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

  programs.git = {
    enable = true;
    userName = settings.gh_username;
    userEmail = settings.gh_email;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
