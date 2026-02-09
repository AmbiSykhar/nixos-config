{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      gestures = {
        hot-corners.enable = false;
      };

      input = {
        keyboard = {
          xkb.layout = "us";
          numlock = true;
        };
      };

      layout = {
        gaps = 4;
        center-focused-column = "never";
        always-center-single-column = true;
        default-column-width = { proportion = 0.5; };
        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 1;
          active = { color = "#ffc42a"; };
          inactive = { color = "#a28cc4"; };
          urgent = { color = "#d8184d"; };
        };
      };

      prefer-no-csd = true;
      screenshot-path = null;

      cursor = {
        theme = "Future-dark-cursors";
        size = 36;
      };

      window-rules = [
        {
          draw-border-with-background = false;
          clip-to-geometry = true;
        }
      ];

      binds = {
        "Mod+Shift+Slash".action.show-hotkey-overlay = [];

        "Mod+T" = {
          hotkey-overlay.title = "Open a Terminal: kitty";
          action.spawn = "kitty";
        };
        "Mod+D" = {
          hotkey-overlay.title = "Open Application Launcher: fuzzel";
          action.spawn = "fuzzel";
        };
        "Mod+S" = {
          hotkey-overlay.title = "Open File Browser: superfile";
          action.spawn-sh = "kitty superfile";
        };

        "Mod+Q" = {
          repeat = false;
          action.close-window = [];
        };

        "Mod+Left".action.focus-column-left = [];
        "Mod+Down".action.focus-window-or-workspace-down = [];
        "Mod+Up".action.focus-window-or-workspace-up = [];
        "Mod+Right".action.focus-column-right = [];
        "Mod+H".action.focus-column-left = [];
        "Mod+J".action.focus-window-or-workspace-down = [];
        "Mod+K".action.focus-window-or-workspace-up = [];
        "Mod+L".action.focus-column-right = [];

        "Mod+Ctrl+Left".action.move-column-left = [];
        "Mod+Ctrl+Down".action.move-window-down-or-to-workspace-down = [];
        "Mod+Ctrl+Up".action.move-window-up-or-to-workspace-up = [];
        "Mod+Ctrl+Right".action.move-column-right = [];
        "Mod+Ctrl+H".action.move-column-left = [];
        "Mod+Ctrl+J".action.move-window-down-or-to-workspace-down = [];
        "Mod+Ctrl+K".action.move-window-up-or-to-workspace-up = [];
        "Mod+Ctrl+L".action.move-column-right = [];

        "Mod+Shift+Left".action.focus-monitor-left = [];
        "Mod+Shift+Down".action.focus-monitor-down = [];
        "Mod+Shift+Up".action.focus-monitor-up = [];
        "Mod+Shift+Right".action.focus-monitor-right = [];
        "Mod+Shift+H".action.focus-monitor-left = [];
        "Mod+Shift+J".action.focus-monitor-down = [];
        "Mod+Shift+K".action.focus-monitor-up = [];
        "Mod+Shift+L".action.focus-monitor-right = [];

        "Mod+Shift+Ctrl+Left".action.move-window-to-monitor-left = [];
        "Mod+Shift+Ctrl+Down".action.move-window-to-monitor-down = [];
        "Mod+Shift+Ctrl+Up".action.move-window-to-monitor-up = [];
        "Mod+Shift+Ctrl+Right".action.move-window-to-monitor-right = [];
        "Mod+Shift+Ctrl+H".action.move-window-to-monitor-left = [];
        "Mod+Shift+Ctrl+J".action.move-window-to-monitor-down = [];
        "Mod+Shift+Ctrl+K".action.move-window-to-monitor-up = [];
        "Mod+Shift+Ctrl+L".action.move-window-to-monitor-right = [];

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+0".action.focus-workspace = 10;

        "Mod+Ctrl+1".action.move-window-to-workspace = 1;
        "Mod+Ctrl+2".action.move-window-to-workspace = 2;
        "Mod+Ctrl+3".action.move-window-to-workspace = 3;
        "Mod+Ctrl+4".action.move-window-to-workspace = 4;
        "Mod+Ctrl+5".action.move-window-to-workspace = 5;
        "Mod+Ctrl+6".action.move-window-to-workspace = 6;
        "Mod+Ctrl+7".action.move-window-to-workspace = 7;
        "Mod+Ctrl+8".action.move-window-to-workspace = 8;
        "Mod+Ctrl+9".action.move-window-to-workspace = 9;
        "Mod+Ctrl+0".action.move-window-to-workspace = 10;

        "Mod+BracketLeft".action.consume-or-expel-window-left = [];
        "Mod+BracketRight".action.consume-or-expel-window-right = [];

        "Mod+R".action.switch-preset-column-width = [];
        "Mod+Shift+R".action.switch-preset-window-height = [];
        "Mod+Ctrl+R".action.reset-window-height = [];
        "Mod+F".action.maximize-column = [];
        "Mod+Shift+F".action.fullscreen-window = [];
        "Mod+Ctrl+F".action.expand-column-to-available-width = [];
        "Mod+C".action.center-column = [];
        "Mod+Ctrl+C".action.center-visible-columns = [];

        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";
        "Mod+Shift+Minus".action.set-window-height = "-10%";
        "Mod+Shift+Equal".action.set-window-height = "+10%";

        "Mod+V".action.toggle-window-floating = [];
        "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];

        "Mod+W".action.toggle-column-tabbed-display = [];

        "Print".action.screenshot = [];
        "Shift+Print".action.screenshot-window = [];
        "Ctrl+Print".action.screenshot-screen = [];

        "Mod+Escape" = {
          allow-inhibiting = false;
          action.toggle-keyboard-shortcuts-inhibit = [];
        };

        "Ctrl+Alt+Delete".action.quit = [];

        "Mod+Shift+P".action.power-off-monitors = [];

        "XF86MonBrightnessDown".action.spawn-sh = "brightnessctl --class=backlight set 10%-";
        "XF86MonBrightnessUp".action.spawn-sh = "brightnessctl --class=backlight set +10%";
        "XF86AudioMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
        "XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
        "XF86AudioMicMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        # "XF86TouchpadOn".action.
      };
    };
  };
}
