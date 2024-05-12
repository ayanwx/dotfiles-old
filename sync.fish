mkdir -p $HOME/dotfiles/config/

# GUI
cp -r $HOME/.config/{kitty, bspwm, sway, rofi, picom, dunst} config/

# CLI
cp -r $HOME/.config/{fish, fontconfig, fastfetch, sxhkd, micro} config/

# X
cp -r $HOME/{.xinitrc, .xprofile} config/
