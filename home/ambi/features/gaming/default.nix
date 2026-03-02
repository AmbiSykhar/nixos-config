{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    archipelago   # Multigame multiworld randomizer
    itch          # Indie game platform
    melonds       # NDS Emulator
    mgba          # GBA emulator
    poptracker    # Randomizer tracker
    prismlauncher # Minecraft launcher
    shipwright    # Ocarina of Time PC Port
    theclicker    # Autoclicker
    vintagestory  # Survival game
    xivlauncher   # Final Fantasy XIV
  ];
}
