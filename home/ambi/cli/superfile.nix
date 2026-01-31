{ config, pkgs, ... }:

{
	programs.superfile = {
		enable = true;

		settings = {
			theme = "draconic";
			transparent_background = false;
		};

		themes = {
			draconic = {
				# Code syntax highlight theme (you can go to https://github.com/alecthomas/chroma/blob/master/styles to find one you like)
				code_syntax_highlight = "catppuccin-mocha";
				# ========= Border =========
				file_panel_border = "#a28cc4";
				sidebar_border = "#4e4062";
				footer_border = "#a28cc4";

				# ========= Border Active =========
				file_panel_border_active = "#ffffff";
				sidebar_border_active = "#ffffff";
				footer_border_active = "#ffffff";
				modal_border_active = "#868686";

				# ========= Background (bg) =========
				full_screen_bg = "#1e1e2e";
				file_panel_bg = "#1e1e2e";
				sidebar_bg = "#1e1e2e";
				footer_bg = "#1e1e2e";
				modal_bg = "#1e1e2e";

				# ========= Foreground (fg) =========
				full_screen_fg = "#c1bbd6";
				file_panel_fg = "#c1bbd6";
				sidebar_fg = "#c1bbd6";
				footer_fg = "#c1bbd6";
				modal_fg = "#c1bbd6";

				# ========= Special Color =========
				cursor = "#ffc42a";
				correct = "#26bf5a";
				error = "#d8184d";
				hint = "#3b6bfe";
				cancel = "#eba0ac";
				# Gradient color can only have two color!
				gradient_color = ["#89b4fa" "#cba6f7"];

				# ========= File Panel Special Items =========
				file_panel_top_directory_icon = "#a6e3a1";
				file_panel_top_path = "#89b5fa";
				file_panel_item_selected_fg = "#98D0FD";
				file_panel_item_selected_bg = "#1e1e2e";

				# ========= Sidebar Special Items =========
				sidebar_title = "#74c7ec";
				sidebar_item_selected_fg = "#A6DBF7";
				sidebar_item_selected_bg = "#1e1e2e";
				sidebar_divider = "#868686";

				# ========= Modal Special Items =========
				modal_cancel_fg = "#383838";
				modal_cancel_bg = "#eba0ac";

				modal_confirm_fg = "#383838";
				modal_confirm_bg = "#89dceb";

				# ========= Help Menu =========
				help_menu_hotkey = "#89dceb";
				help_menu_title = "#eba0ac";
			};
		};
	};
}
