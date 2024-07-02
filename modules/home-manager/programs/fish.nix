{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons auto";
      tree = "eza --tree --icons auto";
      du = "dust";
      cat = "bat --theme base16 --paging never -p";
      icat = "kitty icat";
      spotblock = "~/Documents/spotblock-rs/target/release/spotblock-rs";
      fucking = "sudo";
    };
    functions = {
      fish_greeting = {
        body = "clear && neofetch";
      };
    };
  };
}
