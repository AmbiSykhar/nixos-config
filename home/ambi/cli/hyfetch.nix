{ config, pkgs, ... }:

{
	programs.hyfetch = {
		enable = true;
		settings = {
			preset = "lesbian";
			mode = "rgb";
			lightness = 0.6;
			color_align = {
				mode = "horizontal";
			};
		};
	};
}
