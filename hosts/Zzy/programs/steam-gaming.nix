{ config, lib, pkgs, ... }:

{
  programs.gamemode.enable = true;

  programs.gamescope = {
    enable = true;

    # Úsalo solo si quieres darle prioridad RT a gamescope.
    # Si llegas a notar rarezas, puedes probar a ponerlo en false.
    capSysNice = true;
  };

  programs.steam = {
    enable = true;

    # No lo uses como sesión global dentro de niri.
    gamescopeSession.enable = false;

    # Útil si quieres Proton GE de forma declarativa.
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    vulkan-tools
    mesa-demos
    gamescope

    # Opcional: útil para probar launch options con overlays
    gamemode
  ];

  # En AMD/Mesa evita fijar overrides raros por defecto.
  # Mesa recomienda no establecer env vars salvo necesidad real.
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      lib.makeSearchPath "compatibilitytools.d" config.programs.steam.extraCompatPackages;
  };
}
