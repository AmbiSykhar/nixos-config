{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      #package = pkgs.nerd-fonts.jetbrains-mono;
      size = 13.0;
    };
    shellIntegration.enableFishIntegration = true;
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      disable_ligatures = "never";
    };
    extraConfig = ''
      # BEGIN_KITTY_THEME
      # Draconic
      include themes/draconic.conf
      # END_KITTY_THEME
    '';
  };
}
