
{ pkgs, ... }:
{
  services.polkit-gnome.enable = true;

  systemd.user.services.polkit-agent = {
    Unit = {
      Description = "Polkit auth agent (GNOME) - Niri only";
      After = [ "niri-session.target" ];
      PartOf = [ "niri-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install.WantedBy = [ "niri-session.target" ];
  };
}
