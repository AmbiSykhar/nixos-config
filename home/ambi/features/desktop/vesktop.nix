{ config, pkgs, ... }:

{
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      minimizeToTray = false;
      arRPC = false;
      splashColor = "color(srgb 0.756863 0.733333 0.839216)";
      splashBackground = "rgb(0, 0, 0)";
      spellCheckLanguages = [ "en-US" "en" ];
    };
    vencord = {
      settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        useQuickCss = true;
        eagerPatches = false;
        enableReactDevtools = false;
        frameless = true;
        transparent = true;
        winCtrlQ = false;
        disableMinSize = true;
        winNativeTitleBar = false;
        plugins = {
          ChatInputButtonAPI = {
            enabled = true;
          };
        };
        enabledThemes = [
          "DiscordRecolor.theme.css"
          "ClearVision-v7-BetterDiscord.theme.css"
        ];
        themeLinks = [];
      };
    };
  };
}
