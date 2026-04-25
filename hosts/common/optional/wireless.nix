{ lib, ... }:
{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.networkmanager = {
    enable = lib.mkDefault true;
    wifi.powersave = false;
  };

  users.groups = {
    network = {};
    networkmanager = {};
  };
}
