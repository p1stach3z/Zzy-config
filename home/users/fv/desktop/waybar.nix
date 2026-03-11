
{ pkgs, ... }:
{
  programs.waybar.enable = true;
  # IMPORTANTE: NO usar el auto-service de HM si tú controlas el servicio:
  programs.waybar.systemd.enable = false;

  systemd.user.services.waybar = {
    Unit = {
      Description = "Waybar - Niri only";
      After = [ "niri-session.target" ];
      PartOf = [ "niri-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.waybar}/bin/waybar";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install.WantedBy = [ "niri-session.target" ];
  };
}
