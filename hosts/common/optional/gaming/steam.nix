{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    protontricks.enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs': with pkgs'; [
        libxcursor
        libxi
        libxinerama
        libxscrnsaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };
}
