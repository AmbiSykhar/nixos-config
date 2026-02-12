{ config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        width = 30;
        font = "JetBrainsMono Nerd Font:size=13";
        use-bold = "yes";
        line-height = 30;
        lines = 10;
        tabs = 2;
      };
      colors = {
        background = "11032bf0";
        text = "c1bbd6ff";
        prompt = "c1bbd6ff";
        input = "c1bbd6ff";
        match = "ffffffff";
        selection = "22153cff";
        selection-text = "ffffffff";
        selection-match = "ffdf00ff";
        border = "a28cc4ff";
      };
      border = {
        radius = 0;
      };
    };
  };
}
