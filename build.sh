#!/run/current-system/sw/bin/sh

if [ $1 = "--clean" ]; then
    sudo nixos-rebuild switch --flake . && sudo nix-collect-garbage -d
else
    sudo nixos-rebuild switch --flake .
fi