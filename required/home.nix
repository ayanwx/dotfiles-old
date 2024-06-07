{
  config,
  settings,
  pkgs,
  ...
}:
{
  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";

  programs.git = {
    enable = true;
    userName = settings.gh_username;
    userEmail = settings.gh_email;
  };

  home.file = {
    ".config/fish/fish_variables".source = ../config/fish/fish_variables;
  };

  programs.fish = {
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

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
