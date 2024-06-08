<div align="center">

<img src=".github/assets/banner-dark.svg#gh-dark-mode-only" >
<img src=".github/assets/banner-light.svg#gh-light-mode-only" >

</div>

## Build Instructions
 - Clone this repo
 - Replace `./required/hardware-configuration.nix` with your own hardware config.
 - (WSL) Disable GUI apps [[./modules/apps/default.nix](modules/apps/default.nix)]
 - (WSL) Disable systemd services [[./flake.nix](flake.nix)]
 - Run `sudo nixos-rebuild [switch|boot|whatever]`

## Explanation
 - `./settings.nix`: self-explanatory, read the file
 - `./required/configuration.nix`: replacement for `/etc/nixos/configuration.nix`, modularized into `./modules/`
 - `./required/hardware-configuration.nix`: replacement for `/etc/nixos/hardware-configuration.nix`
 - `./required/home.nix`: home-manager configuration
 - `./config/`: files that will be in `~/.config/`

[TO-DO]