# NixOS WSL Configuration

Nix OS own configuration for WSL2 on Windows 11
- Tested on Windows 11 23H2 and WSL kernel 5.15.146.1-microsoft-standard-WSL2

## Installation

- Install NixOS WSL (see: https://github.com/nix-community/NixOS-WSL)
- Enter into wsl and update distro
```
wsl -d NixOS
sudo nix-channel --add https://nixos.org/channels/nixos-23.11 nixos
sudo nix-channel --update
```
- Clone repository and rebuild nixos
```
nix-shell -p git neovim
git clone https://github.com/tangtang95/nixos-wsl.git /tmp/configuration
sudo nixos-rebuild switch --flake /tmp/configuration
```
- Restart WSL and the user should be now "tangtang" instead of the default "nixos"
```
wsl -t NixOS
wsl -d NixOS
```
- Move NixOS configuration to HOME dir
```
mv /tmp/configuration ~/configuration
```

### Optional
- Install rust tools (need to move it into nixos build phase)
```
rustup default stable
rustup component add rust-analyzer
```
