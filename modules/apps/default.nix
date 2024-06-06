{ pkgs, ... }:
{
  programs.fish.enable = true; # fish shell
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition; # developer edition for webdev tools
  };

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [

    # { Esssentials
    micro # editor
    wget
    neofetch
    # }

    # { Utilities
    bat # better cat
    eza # better ls
    du-dust # better du
    ripgrep # better grep
    zip
    imagemagick # image editing tools
    btrfs-progs
    compsize
    gh # github cli
    ranger # cli file manager
    fzf # file search
    tmux
    # }

    # { WM
    eww # widgets
    kitty # terminal emulator
    rofi # app launcher
    dunst # notifications
    maim # screenshots
    feh # image viewer, wallpaper
    xclip # clipboard manager
    pavucontrol # pulseaudio volume control
    gparted
    xfce.thunar
    xfce.tumbler # thumbnails for thunar
    lxappearance # gtk theming
    # }

    # { Media
    spotify
    vlc
    playerctl
    # }

    # { Browsers
    vivaldi
    floorp
    # }

    # { Development
    vscode
    neovim
    neovide # gui for neovim
    rustup
    go
    clang
    nodejs_22
    python3
    pipx
    yarn
    ngrok

    direnv
    nixfmt-rfc-style # nix language formatter

    blender
    godot_4
    # }

    # { Torrent
    qbittorrent
    # }
  ];
}
