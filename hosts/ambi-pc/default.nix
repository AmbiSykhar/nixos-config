# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ (final: prev: {
    inherit (prev.lixPackageSets.stable)
      nixpkgs-review
      nix-eval-jobs
      nix-fast-build
      colmena;
  })];
  # nix.package = pkgs.lixPackageSets.stable.lix;

  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../../users/ambi

    ../common/global
  ];

  networking = {
    hostName = "ambi-pc";
    networkmanager.enable = true;
  };

  hardware.nvidia.open = true;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  fileSystems."/home/ambi/Games" = {
    device = "/dev/disk/by-uuid/e24e9789-b4dd-4b13-bc0a-aa71683f9b8f";
    fsType = "ext4";
    options = [ "nofail" ];
  };
  fileSystems."/home/ambi/Storage" = {
    device = "/dev/disk/by-uuid/605e2356-f115-49a8-a4b0-b3259fbed4b5";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    lm_sensors
    openrgb-with-all-plugins
    tuigreet
    home-manager
    qbittorrent
  ];

  programs = {
    fish.enable = true;
    gamemode.enable = true;
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

  hardware.openrazer.enable = true;

  # List services that you want to enable:
  services = {
    blueman.enable = true;
    hardware.openrgb.enable = true;
    input-remapper.enable = true;
    openssh.enable = true;
    qbittorrent.enable = true;

    mpd = {
        enable = true;
        #dataDir = "/home/ambi/Music/mpd";
    };

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

  environment.variables.EDITOR = "hx";

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
