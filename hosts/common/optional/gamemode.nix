{ pkgs, ... }:

{
  programs.gamemode = {
    enable = true;
    settings = {
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'Game Mode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'Game Mode ended'";
      };
    };
  };
}
