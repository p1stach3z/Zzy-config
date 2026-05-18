{ config, lib, pkgs, ... }:

{
  services.xserver.enable = false;
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = false;
  services.displayManager.ly.enable = false;

  services.greetd = {
    enable = true;

    settings = {
      useTextGreeter = true;
      default_session = {
        user = "fv";
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --remember \
        '';
      };
    };
  };
}
