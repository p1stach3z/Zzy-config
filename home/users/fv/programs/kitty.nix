
{ config, pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableBashIntegration = true;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      font_family = "JetBrains Mono";
      font_size = 13.0;
      background_opacity = 0.6;
      background_blur = 1;
    };
  };
}
