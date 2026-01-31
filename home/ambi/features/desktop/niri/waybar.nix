{ config, pkgs, ... }:

{
	programs.waybar = {
		enable = true;
		# TODO: settings and style

		systemd = {
			enable = true;
		};
	};
}
