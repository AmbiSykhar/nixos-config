{ config, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../users/ambi
    ../../users/vivi
    ../../users/zygan

    ../common/global
  ];

  networking = {
    hostName = "hoard";
    networkmanager.enable = true;
  };

  system.stateVersion = "25.11"; # DO NOT CHANGE
}
