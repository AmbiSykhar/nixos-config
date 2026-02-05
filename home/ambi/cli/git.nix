{ config, pkgs, ... }:

{
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "Ambi Sykhar";
				email = "github@alayna.dev";
			};
			init.defaultBranch = "main";
		};
		ignores = [
			".direnv"
			"result"
		];
	};
}
