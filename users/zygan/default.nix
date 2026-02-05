{ pkgs, config, lib, ... }:

{
  users.users.zygan = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "openrazer"
      "wheel"
    ];
    initialPassword = "zygan";

    packages = [ pkgs.home-manager ];
  };
}
