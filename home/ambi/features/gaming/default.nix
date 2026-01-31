{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    archipelago   # Multigame multiworld randomizer
    itch          # Indie game platform
    melonDS       # NDS Emulator
    mgba          # GBA emulator
    poptracker    # Randomizer tracker
    prismlauncher # Minecraft launcher
    vintagestory  # Survival game
    xivlauncher   # Final Fantasy XIV
  ];
}
