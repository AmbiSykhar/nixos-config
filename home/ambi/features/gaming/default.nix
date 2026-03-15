{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    osu-lazer-bin # Osu!
    prismlauncher # Minecraft launcher
    shipwright    # Ocarina of Time PC Port
    vintagestory  # Survival game
    xivlauncher   # Final Fantasy XIV

    # Platforms
    itch          # Indie game platform

    # Randomizers
    archipelago   # Multigame multiworld randomizer
    poptracker    # Randomizer tracker

    # Emulators
    azahar        # 3DS
    cemu          # Wii U
    dolphin-emu   # Gamecube + Wii
    melonds       # NDS
    mgba          # GBA

     # Tools
    theclicker    # Autoclicker
  ];
}
