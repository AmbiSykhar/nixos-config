{ ... }:

{
  imports = [
    ./global.nix
    ./features/desktop/niri
    ./features/gaming
  ];

  programs.niri.settings.outputs = {
    "ViewSonic Corporation VX3276-QHD V9W221840544" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 75.0;
      };
      position = {
        x = 1200;
        y = 185;
      };
      scale = 1;
      focus-at-startup = true;
    };
    "ASUSTek COMPUTER INC PA248QV RBLMQS003421" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 75.0;
      };
      position = {
        x = 0;
        y = 0;
      };
      scale = 1;
      transform.rotation = 90;
    };
  };
}
