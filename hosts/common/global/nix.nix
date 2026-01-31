{ pkgs, ... }:

{
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      trusted-users = [
        "root"
        "@wheel"
      ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };
}
