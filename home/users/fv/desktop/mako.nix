
{ pkgs, ... }:
{
  services.mako.enable = true;

  systemd.user.services.mako = {
    Unit = {
      Description = "Mako - Niri only";
      After = [ "niri-session.target" ];
      PartOf = [ "niri-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.mako}/bin/mako";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install.WantedBy = [ "niri-session.target" ];
  };
}
