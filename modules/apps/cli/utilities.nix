{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat # better cat
    eza # better ls
    du-dust # better du
    ripgrep # better grep
    gh # github cli
    ranger # cli file manager
    fzf # file search
    imagemagick # image editing tools
    xclip # clipboard manager
    p7zip # archive manager
    unrar # un-rar
    btrfs-progs # betterfs
    #lynx # web browser
    glow # markdown reader
    tokei # SLOC
    yt-dlp # youtoob downloader
    jq # json thingy
    bottom # system usage graph
    ntfs3g # ntfs
    cloudflare-warp # 1.1.1.1
    dconf
    killall
    compsize
    tmux
  ];
}
