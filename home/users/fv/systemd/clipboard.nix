{ pkgs, config, lib, ... }:

{
  systemd.user.services.cliphist-text = {
    Unit = {
      Description = "Clipboard history watcher (text)";
      PartOf = [ "niri-session.target" ];
      After = [ "niri-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "always";
      RestartSec = 1;
    };

    Install.WantedBy = [ "niri-session.target" ];
  };

  systemd.user.services.cliphist-image = {
    Unit = {
      Description = "Clipboard history watcher (image)";
      PartOf = [ "niri-session.target" ];
      After = [ "niri-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "always";
      RestartSec = 1;
    };

    Install.WantedBy = [ "niri-session.target" ];
  };
}
