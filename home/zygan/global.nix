{ config, pkgs, ... }:

{
  imports = [
  ];

  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = "zygan";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.11";
    sessionPath = [ "$HOME/.local/bin" ];
  };
}
