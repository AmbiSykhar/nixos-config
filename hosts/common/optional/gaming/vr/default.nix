{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    basalt-monado
  ];
  programs.envision.enable = true;
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
    WMR_HANDTRACKING = "0";

    VIT_SYSTEM_LIBRARY_PATH = "${pkgs.basalt-monado}/lib/libbasalt.so";
  };
}
