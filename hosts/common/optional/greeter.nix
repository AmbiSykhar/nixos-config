{ inputs, pkgs, ... }:

{
  imports = [
    inputs.sysc-greet.nixosModules.default
  ];
  services.greetd = {
    enable = true;
  };

  services.sysc-greet = {
    enable = true;
    compositor = "niri";
    settings = {
      initial_session = {
        command = "Niri";
        user = "ambi";
      };
    };
  };
}
