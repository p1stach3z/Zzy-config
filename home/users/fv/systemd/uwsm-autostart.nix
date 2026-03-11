
{ pkgs, lib, ... }:
let
  bashlc = cmd: "${pkgs.bash}/bin/bash -lc ${lib.escapeShellArg cmd}";
in
{
  # UWSM autostart (tty1 only). Reemplaza hacks en bash.
  systemd.user.services.uwsm-autostart = {
    Unit = {
      Description = "Auto-start UWSM on tty1 (user)";
      After = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = bashlc ''
        if [ "$(tty)" = "/dev/tty1" ] && [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ]; then
          if command -v uwsm >/dev/null 2>&1; then
            if uwsm check may-start && uwsm select; then
              exec uwsm start default
            fi
          fi
        fi
      '';
      Restart = "no";
    };
    Install.WantedBy = [ "default.target" ];
  };
}
