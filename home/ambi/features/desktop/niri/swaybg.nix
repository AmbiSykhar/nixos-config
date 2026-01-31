{ config, pkgs, ... }:

{
  home.packages = [ pkgs.swaybg ];

  systemd.user.services.swaybg = {
    Unit = {
      Description = "Desktop wallpaper";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i '${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper.png'";
      Restart = "on-failure";
    };
  };
}
