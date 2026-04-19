
{ config, lib, pkgs, ... }:
{
  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
      args = [ "--steam" ];
      steamArgs = [ "-tenfoot"];
      env = {
        SDL_VIDEODRIVER = "wayland";
        AMD_VULKAN_ICD = "RADV";
      };
    };
  };
}
