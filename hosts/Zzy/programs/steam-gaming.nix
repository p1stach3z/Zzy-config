
{ config, lib, pkgs, ... }:
{
  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
      args = [ "-f" "-F" "fsr" "--fsr-sharpness" "2" "--xwayland-count" "2" "--rt" "--steam" ];
      steamArgs = [ "-tenfoot" "-pipewire-dmabuf" "-vulkan" "-dev" ];
      env = {
        SDL_VIDEODRIVER = "wayland";
        AMD_VULKAN_ICD = "RADV";
        STEAM_ENABLE_VOLUME_HANDLER = "1";
      };
    };
  };
}
