{ pkgs, config, lib, ... }:

{
  users.users.ambi = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "openrazer"
      "wheel"
    ];

    packages = [ pkgs.home-manager ];
  };
}
