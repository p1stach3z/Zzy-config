{ config, lib, pkgs, ... }:

{
  programs.niri.enable = true;

  programs.uwsm = {
    enable = true;

    waylandCompositors = {
      niri = {
        prettyName = "Niri";
        comment = "Niri compositor managed by UWSM";
        binPath = "${pkgs.niri-unstable}/bin/niri-session";
      };

      steam = {
        prettyName = "Steam Gamescope Session";
        comment = "Gamescope session for Steam";
        binPath = "/run/current-system/sw/bin/steam-gamescope";
      };
    };
  };
}
