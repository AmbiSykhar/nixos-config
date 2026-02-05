{ config, pkgs, ... }:

{
  imports = [
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    egl-wayland
    libnotify
    nautilus # GNOME file manager
    wttrbar # Allows waybar to access weather
    xwayland-satellite
  ];

  programs = {
    #swaylock.enable = true;
    #thunderbird = {
    #  enable = true;
    #};
  };

  services = {
    #swayidle.enable = true;
  };
}
