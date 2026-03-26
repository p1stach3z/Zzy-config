
{ pkgs, lib, ... }:
let
  bashlc = cmd: "${pkgs.bash}/bin/bash -lc ${lib.escapeShellArg cmd}";
in
{
  systemd.user.targets.niri-session = {
    Unit = {
      Description = "Niri session target (user)";
      BindsTo = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
  };

  systemd.user.services.niri-session-activator = {
    Unit = {
      Description = "Activate niri-session target when desktop is niri";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecCondition = bashlc ''[ "''${XDG_CURRENT_DESKTOP:-}" = "niri" ]'';
      ExecStart = "${pkgs.systemd}/bin/systemctl --user start niri-session.target";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
