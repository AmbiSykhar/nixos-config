{ lib, ... }:
{
  services = {
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
    gnome.games.enable = false;
  };
  services.avahi.enable = false;
  networking.networkmanager.enable = lib.mkForce false;
}
