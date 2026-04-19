{ config, lib, pkgs, ... }:

{
  services.xserver.enable = false;
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = false;
  services.displayManager.ly.enable = false;

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        user = "greeter";
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --remember \
            --asterisks \
        '';
      };
      sessions = {
        steam-gaming = {
          command = ''
            ${lib.getExe pkgs.gamescope} \
              -W 1920 -H 1080 -f -e \
              --xwayland-count 2 \
              -- steam -gamepadui
        '';
        user = "fv";
        };
      };
    };
  };
}
