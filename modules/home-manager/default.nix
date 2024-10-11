{
  config,
  settings,
  pkgs,
  ...
}:
{

  imports = [
    ./files
    ./services
    ./programs
    ./gtk.nix
    ./xsession.nix
  ];

  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";

  /**
      set --export XDG_CONFIG_HOME "$HOME/.config"
      set --export XDG_CACHE_HOME "$HOME/.cache"
      set --export XDG_BIN_HOME "$HOME/dotfiles/scripts/bin"
      set --export NIXPKGS_ALLOW_UNFREE 1
      set --export ANDROID_HOME "$HOME/Android/Sdk"
  */

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_BIN_HOME = "$HOME/dotfiles/scripts/bin";
    ANDROID_HOME = "$HOME/Android/Sdk";
    NIXPKGS_ALLOW_UNFREE = 1;
    EDITOR = "micro";
  };

  programs.git = {
    enable = true;
    userName = settings.gh_username;
    userEmail = settings.gh_email;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
