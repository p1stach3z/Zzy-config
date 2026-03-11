{ pkgs, config, lib, ... }:

{

  systemd.user.services.cliphist = {
    Unit = {
      Description = "Clipboard history daemon";
      WantedBy = [ "default.target" ];
    };
    Service = { 
      ExecStart = "${pkgs.cliphist}/bin/cliphist store";
      Restart = "always";
    };
  };

}
