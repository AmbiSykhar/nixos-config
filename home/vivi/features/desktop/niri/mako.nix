{ config, pkgs, ... }:

{
	services.mako = {
		enable = true;

		settings = {
			actions = true;
			anchor = "top-right";
			background-color = "#11032b";
			border-color = "#a28cc4";
			border-radius = 0;
			border-size = 1;
			default-timeout = 3000;
			font = "JetBrainsMono Nerd Font 10";
			height = 110;
			icons = true;
			ignore-timeout = false;
			layer = "overlay";
			markup = true;
			max-icon-size = 64;
			sort = "-time";
			width = 300;

			"urgency=low" = {
				border-color = "#6d1fbe";
			};
			"urgency=normal" = {
				border-color = "#a28cc4";
			};
			"urgency=high" = {
				border-color = "#d8184d";
				default-timeout = 0;
			};
		};
	};
}
