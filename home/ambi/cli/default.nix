{ config, pkgs, ... }:

{
  imports = [
    ./bat.nix
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
    kew # TUI music player
    nodePackages.nodejs # Javascript
    p7zip # 7zip
    proton-vpn-cli # VPN CLI
  ];
}
