{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.tuigreet ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -tr --asterisks --remember-user-session --user-menu";
        user = "greeter";
      };
    };
  };
}
