{ config, pkgs, ... }:

{
  programs.waybar.settings.mainBar = {
    "custom/left-edge" = {
      format = " ";
      tooltip = false;
    };
    "custom/separator" = {
      format = " ";
      tooltip = false;
    };
    "custom/right-edge" = {
      format = " ";
      tooltip = false;
    };

    "group/traym" = {
      orientation = "horizontal";
      drawer = {};
      modules = [ "custom/trayicon" "tray" ];
    };
    "custom/trayicon" = {
      format = "󱄅";
      tooltip = false;
    };
    "tray" = {
      icon-size = 18;
      spacing = 4;
    };
    "niri/workspaces" = {
      format = "{index}";
      disable-click = true;
    };
    "custom/niri-columns" = {
      format = "{text}";
      exec = "${pkgs.nodejs}/bin/node ${config.xdg.configHome}/waybar/assets/niri-columns.js";
      restart-interval = 10;
      return-type = "json";
    };
    "niri/window" = {
      format = "{title}";
      max-length = 48;
      icon = true;
      icon-size = 18;
      rewrite = {
        "(.*) — Ablaze Floorp" = "$1";
      };
      separate-outputs = true;
    };
    "network#info" = {
      interval = 10;
      format = "";
      format-disconnected = "󱘖";
      on-click = "kitty nmtui";
      tooltip = false;
    };
    "battery" = {
      format = "{icon} {capacity}%";
      format-icons = {
        default = [ "󰂎" "󱊡" "󱊢" "󱊣" ];
        charging = [ "󰢟" "󱊤" "󱊥" "󱊦" ];
      };
      min-length = 5;
      interval = 5;
      tooltip = false;
    };
    "temperature" = {
      interval = 5;
      min-length = 5;
      format = "{icon} {temperatureC}°";
      format-icons = [ "" "" "" "" "" ];
      critical-threshold = 90;
      tooltip = false;
    };
    "cpu" = {
      interval = 5;
      min-length = 5;
      format = " {usage}%";
      states = {
        warning = 80;
        critical = 95;
      };
    };
    "custom/nvidia" = {
      interval = 5;
      exec = "${config.xdg.configHome}/waybar/assets/nvidia.sh";
      return-type = "json";
      min-length = 5;
      format = "󰢮 {text}";
      states = {
        warning = 80;
        critical = 95;
      };
      tooltip = true;
      tooltip-format = "{alt}";
    };
    "memory#ram" = {
      interval = 5;
      min-length = 5;
      format = " {percentage}%";
      states = {
        warning = 80;
        critical = 95;
      };
      tooltip = true;
      tooltip-format = "{used}/{total} GiB";
    };
    "bluetooth" = {
      format = "";
      format-disabled = "";
      format-connected = "󰂰";
    };
    "pulseaudio#output" = {
      format = "{icon} {volume}%";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        default = [
          ""
          ""
        ];
      };
      format-muted = " {volume}%";
      tooltip = true;
      max-volume = "100";
      scroll-step = 1;
      min-length = 6;

      on-click-right = "pavucontrol";
    };
    "custom/weather" = {
      format = "{}°";
      tooltip = true;
      interval = 60;
      exec = "wttrbar --nerd --location 'Grand Rapids'";
      return-type = "json";
    };
    "clock" = {
      interval = 1;
      format = " {:%a %m/%d %H:%M}";
    };

  };
}
