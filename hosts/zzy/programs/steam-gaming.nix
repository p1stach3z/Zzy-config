
{ config, lib, pkgs, ... }:
{
  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
      args = [ "-f" "-F" "fsr" "--fsr-sharpness" "2" "--xwayland-count" "2" "--rt" "--steam" ];
      steamArgs = [ "-tenfoot" "-pipewire-dmabuf" "vulkan" "-dev" ];
      env = {
        SDL_VIDEODRIVER = "wayland";
        AMD_VULKAN_ICD = "RADV";
        WLR_RENDERER = "vulkan";
        STEAM_GAMESCOPE_FANCY_SCALING_SUPPORT = "1";
        STEAM_ENABLE_VOLUME_HANDLER = "1";
        STEAM_GAMESCOPE_COLOR_MANAGED = "1";
        STEAM_GAMESCOPE_VIRTUAL_WHITE = "1";
      };
    };
  };
}
