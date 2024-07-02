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

  programs.git = {
    enable = true;
    userName = settings.gh_username;
    userEmail = settings.gh_email;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
