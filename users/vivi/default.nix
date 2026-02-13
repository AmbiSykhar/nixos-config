{ pkgs, config, lib, ... }:

{
  users.users.vivi = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "openrazer"
      "wheel"
    ];
    initialPassword = "vivi";

    packages = [ pkgs.home-manager ];
  };
}
