{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim

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
    nil # nix language server
  ];
}
