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

  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../../users/ambi

    ../common/global
    ../common/optional/gaming
    ../common/optional/kdeconnect.nix
    ../common/optional/niri.nix
    ../common/optional/pipewire.nix
    ../common/optional/greeter.nix
    ../common/optional/wireless.nix

    ../common/optional/flatpak.nix
  ];

  networking.hostName = "dragon";

  hardware.nvidia.open = true;

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/e24e9789-b4dd-4b13-bc0a-aa71683f9b8f";
    fsType = "ext4";
    options = [
      "users"
      "exec"
      "nofail"
    ];
  };
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/605e2356-f115-49a8-a4b0-b3259fbed4b5";
    fsType = "ext4";
    options = [
      "users"
      "exec"
      "nofail"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    lm_sensors
    openrgb-with-all-plugins
    # home-manager
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  hardware.openrazer.enable = true;

  # List services that you want to enable:
  services = {
    hardware.openrgb.enable = true;
    # qbittorrent.enable = true;
  };

  security = {
    pam.services.swaylock = {};
    polkit.enable = true;
    soteria.enable = true;
  };

  environment.variables.EDITOR = "hx";

  system.stateVersion = "25.05"; # Did you read the comment?

}
