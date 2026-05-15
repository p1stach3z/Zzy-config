
{ config, pkgs, lib, ... }:
{
  home.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
        
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";

    AMD_VULKAN_ICD = "RADV";
    SDL_VIDEODRIVER="wayland";
    WLR_RENDERER="vulkan";
    STEAM_GAMESCOPE_FANCY_SCALING_SUPPORT="1";
    STEAM_ENABLE_VOLUME_HANDLER="1";
    STEAM_GAMESCOPE_COLOR_MANAGED="1";
    RUSTICL_ENABLE = "radeonsi";
    LIBGL_ALWAYS_SOFTWARE = "1";    

    QT_QPA_PLATFORM = "wayland";
  };

  manual.manpages.enable = true;
  news.display = "show";
}
