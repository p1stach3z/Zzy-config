{ config, lib, pkgs, ... }:

{
  services.xserver.enable = false;
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = false;
  services.displayManager.ly.enable = false;

  services.greetd = {
    enable = true;
    restart = true;
    useTextGreeter = true;

    settings = {
      default_session = {
        user = "greeter";
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --remember \
            --remember-session \
            --remember-user-session \
            --asterisks \
            --user-menu \
            --sessions /run/current-system/sw/share/wayland-sessions:/run/current-system/sw/share/xsessions
        '';
      };
    };
  };
}
