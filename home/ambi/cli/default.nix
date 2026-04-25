{ config, pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fish.nix
    ./git.nix
    ./helix.nix
    ./htop.nix
    ./hyfetch.nix
    ./superfile.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    firewalld
    kew # TUI music player
    p7zip # 7zip
    proton-vpn-cli # VPN CLI
    wl-clipboard-rs # Clipboard
  ];
}
