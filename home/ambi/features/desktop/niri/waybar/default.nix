{ config, pkgs, ... }:

{
	imports = [
		./modules.nix
	];

	programs.waybar = {
		enable = true;

		style = ./style.css;
		settings = {
			mainBar = {
				name = "main";
				layer = "top";
				position = "top";
				height = 31;
				margin = "4 4 0 4";
				spacing = 0;
				exclusive = true;
				fixed-center = true;
				passthrough = false;
				reload_style_on_change = true;

				modules-left = [
					"custom/left-edge"
					"group/traym"
					"custom/separator"
					"niri/workspaces"
					"custom/separator"
					"custom/niri-columns"
					"custom/right-edge"
				];
				modules-center = [
					"custom/left-edge"
					"niri/window"
					"custom/right-edge"
				];
				modules-right = [
					"custom/left-edge"
					"network#info"
					"battery"
					"temperature"
					"cpu"
					"custom/nvidia"
					"memory#ram"
					"custom/separator"
					"pulseaudio#output"
					"bluetooth"
					"custom/separator"
					"custom/weather"
					"clock"
					"custom/right-edge"
				];
			};
		};

		systemd.enable = true;
	};

	home.file."${config.xdg.configHome}/waybar/assets" = {
		source = ./assets;
		recursive = true;
	};
}
