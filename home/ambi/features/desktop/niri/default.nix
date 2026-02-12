{ config, niri, pkgs, ... }:

{
  imports = [
    ../.
    ./cliphist.nix
    ./fuzzel.nix
    ./mako.nix
    ./niri.nix
    ./swaybg.nix
    ./waybar
  ];

  # xdg.configFile = {
  #   "niri/config.kdl".source = ./config/config.kdl;
  #   "niri/host.kdl".source = ./config/${osConfig.networking.hostName}.kdl;
  # };
}
