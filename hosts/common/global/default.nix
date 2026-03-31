{ lib, inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./fish.nix
    ./locale.nix
    ./nix.nix
    ./openssh.nix
    ./systemd.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  programs.appimage.enable = true;

  # services.speechd.enable = lib.mkDefault false;
}
