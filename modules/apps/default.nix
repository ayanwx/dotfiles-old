{ pkgs, ... }:
{
  programs.fish.enable = true;
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [

    # Esssentials
    micro
    wget
    neofetch

    # Utilities
    bat
    eza
    du-dust
    zip
    imagemagick
    btrfs-progs
    compsize
    gh
    ranger
    fzf
    ripgrep
    tmux

    # WM
    eww
    kitty
    rofi
    dunst
    maim
    feh
    xclip
    pulseaudio
    pavucontrol
    gparted
    xfce.thunar
    xfce.tumbler
    sxhkd
    lxappearance

    # Media
    spotify
    vlc
    playerctl

    # Browsers
    vivaldi
    floorp

    # Development
    vscode
    neovim
    neovide
    rustup
    go
    clang
    nodejs_22
    python3
    pipx
    yarn
    ngrok

    direnv
    nixfmt-rfc-style

    blender
    godot_4

    # Torrent
    qbittorrent
  ];
}
