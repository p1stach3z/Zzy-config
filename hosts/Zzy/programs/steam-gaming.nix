{ config, lib, pkgs, ... }:

let
  steamGamescopeWrapper = pkgs.writeShellScript "steam-gamescope-tty" ''
    #!/usr/bin/env bash
    export SDL_VIDEODRIVER=wayland
    export WLR_RENDERER=vulkan
    export AMD_VULKAN_ICD=RADV
    export STEAM_GAMESCOPE_FANCY_SCALING_SUPPORT=1
    export STEAM_ENABLE_VOLUME_HANDLER=1
    export STEAM_GAMESCOPE_COLOR_MANAGED=1

    # Opciones recomendadas de Gamescope tipo Steam Deck
    exec ${pkgs.steam}/bin/steam-gamescope \
      -f -F fsr \
      --fsr-sharpness 2 \
      --xwayland-count 2 \
      --steam \
      "$@"
  '';
in {
  programs.steam.enable = true;

  # No habilitamos GamescopeSession global, porque queremos control manual desde TTY
  programs.steam.gamescopeSession.enable = false;

  # Instalamos nuestro wrapper en PATH para lanzar desde TTY
  environment.systemPackages = with pkgs; [
    steam
    gamescope
  ];

  # Alias opcional para lanzar fácil desde TTY
  home-manager.users.fv.programs.bash.initExtra = ''
    alias steamdeck="${steamGamescopeWrapper}"
  '';
}
