{ pkgs, ... }:
{
  home.packages = with pkgs; [
    blockbench          # Low-poly 3D model editor
    gimp                # Art program/image editor
    lmms                # DAW
    muse-sounds-manager # Musescore soundfont manager
    musescore           # Sheet music program
  ];

  nixpkgs.overlays = [
    (self: super: {
      lmms = super.lmms.overrideAttrs {
        version = "1.3.0-alpha.1";
        src = pkgs.fetchFromGitHub {
          owner = "LMMS";
          repo = "lmms";
          rev = "bda042e1eb59e4c7508faa072051c50c2e12894d";
          sha256 = "sha256-EGJcTzPUkIqURHKjX6dTRkeRTqwHM8eG74lYVILgSAs";
          fetchSubmodules = true;
        };
        patches = [];
      };
    })
  ];
}
