{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    ];
  };
}
