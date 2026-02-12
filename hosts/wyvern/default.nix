# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../../users/ambi
    ../../users/zygan

    ../common/global
    ../common/optional/gamemode.nix

    ../common/optional/steam.nix
    ../common/optional/vr
  ];

  hardware.nvidia = {
    open = false;
    prime = {
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking = {
    hostName = "wyvern";
    networkmanager.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #fileSystems."/home/ambi/Storage" = {
  #  device = "/dev/disk/by-uuid/605e2356-f115-49a8-a4b0-b3259fbed4b5";
  #  fsType = "ext4";
  #  options = [ "nofail" ];
  #};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    tuigreet
    home-manager
  ];

  programs = {
    fish.enable = true;
    neovim.enable = true;
    niri.enable = true;

    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]] then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
    exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      protontricks.enable = true;
      package = pkgs.steam.override {
        extraPkgs = pkgs': with pkgs'; [
          libxcursor
          libxi
          libxinerama
          libxscrnsaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
        ];
      };
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # List services that you want to enable:
  services = {
    blueman.enable = true;
    openssh.enable = true;
    upower.enable = true;

    greetd = {
      enable = true;
      settings = {
        default_session = {
    command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-user-session";
    user = "greeter";
  };
      };
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
  support32Bit = true;
      };
      pulse.enable = true;
    };
  };

  security = {
    pam.services.swaylock = {};
    polkit.enable = true;
    rtkit.enable = true;
    soteria.enable = true;
  };

  environment.variables.EDITOR = "nvim";

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    OZONE_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
