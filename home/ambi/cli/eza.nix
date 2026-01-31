{ config, pkgs, ... }:

{
	programs.eza = {
		enable = true;
		enableFishIntegration = true;
		icons = "always";
	};
}
