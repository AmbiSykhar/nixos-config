{ config, pkgs, ... }:

{
  imports = [
    ./floorp.nix
    ./freetube.nix
    ./kdeconnect.nix
    ./kitty.nix
    ./vesktop.nix
  ];

  home.packages = with pkgs; [
    bitwarden-desktop # Password manager
    muse-sounds-manager # Musescore soundfont manager
    musescore # Sheet music program
    pavucontrol # Audio controller

    egl-wayland
    libnotify
    nautilus # GNOME file manager
    wttrbar # Allows waybar to access weather
    xwayland-satellite

    protonvpn-gui # VPN GUI

    telegram-desktop
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

  home.file."Pictures/Wallpapers/wallpaper.png".source = ./wallpaper.png;
}
