{ lib, ... }:
{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.networkmanager.enable = lib.mkDefault true;

  users.groups = {
    network = {};
    networkmanager = {};
  };
}
