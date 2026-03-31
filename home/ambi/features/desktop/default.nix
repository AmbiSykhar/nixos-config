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
    bitwarden-desktop   # Password manager
    lmms                # DAW
    muse-sounds-manager # Musescore soundfont manager
    musescore           # Sheet music program
    pavucontrol         # Audio controller

    egl-wayland
    libnotify
    nautilus # GNOME file manager
    wttrbar # Allows waybar to access weather
    xwayland-satellite

    proton-vpn # VPN GUI

    telegram-desktop
    qbittorrent
    vlc
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

  nixpkgs.overlays = [
    (self: super: {
      lmms = super.lmms.overrideAttrs {
        version = "1.3.0-alpha.1";
        src = pkgs.fetchFromGitHub {
          owner = "LMMS";
          repo = "lmms";
          rev = "bda042e1eb59e4c7508faa072051c50c2e12894d";
          sha256 = "sha256-EGJcTzPUkIqURHKjX6dTRkeRTqwHM8eG74lYVILgSAs";
          fetchSubmodules = true;
        };
        patches = [];
      };
    })
  ];
}
