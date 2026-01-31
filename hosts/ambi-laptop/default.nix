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

    ../common/global
  ];

  hardware.nvidia = {
    open = false;
    prime = {
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "ambi-laptop";
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    ambi = {
      isNormalUser = true;
      description = "Alayna Beasley";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    vivi = {
      isNormalUser = true;
      description = "Vivian Peterson";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    zygan = {
      isNormalUser = true;
      description = "Matthew Michelsen";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # CLI Utilities
    eza
    fishPlugins.tide
    helix
    hyfetch
    nodePackages.nodejs
    p7zip
    superfile

    # Neovim Plugins
    vimPlugins.lazy-nvim
    vimPlugins.lualine-nvim
    vimPlugins.oil-nvim
    vimPlugins.mini-icons
    vimPlugins.nvim-web-devicons

    # Gaming
    #archipelago
    itch
    lutris
    melonDS
    mgba
    #poptracker
    #prismlauncher
    #vintagestory
    #xivlauncher

    # Misc GUI Applications
    bitwarden-desktop
    freetube
    muse-sounds-manager
    musescore
    pavucontrol

    # Social
    vesktop

    # Development
    jetbrains.clion
    jetbrains.rider

    # Hardware

    # Browser
    floorp-bin

    # Desktop Environment
    egl-wayland
    fuzzel
    kitty
    libnotify
    mako
    nautilus
    swaybg
    swayidle
    swaylock
    tuigreet
    wttrbar
    xwayland-satellite

    # Misc Utilities
    cliphist
    home-manager
  ];

  programs = {
    bat.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    git.enable = true;
    htop.enable = true;
    neovim.enable = true;
    niri.enable = true;
    thunderbird.enable = true;
    vscode.enable = true;
    waybar.enable = true;

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

    tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
	tmux-powerline
      ];
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
    gnome.gnome-keyring.enable = true;
    input-remapper.enable = true;
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
