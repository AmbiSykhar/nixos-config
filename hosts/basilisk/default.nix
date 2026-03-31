# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel

    ./hardware-configuration.nix

    ../../users/ambi
    ../../users/vivi
    ../../users/zygan

    ../common/global
    ../common/optional/gaming
    ../common/optional/gaming/steam-session.nix
    ../common/optional/gnome.nix
    ../common/optional/pipewire.nix
    ../common/optional/wireless.nix
  ];

  networking.hostName = "basilisk"; # Define your hostname.
  networking.networkmanager.enable = true;

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/2ceb55f4-5d64-420d-bc95-53c0fb6ba119";
    fsType = "ext4";
    options = [
      "users"
      "exec"
      "nofail"
    ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    # home-manager
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
