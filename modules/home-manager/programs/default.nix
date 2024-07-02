{ pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./kitty.nix
    ./eww.nix
  ];
}
