{ pkgs, config, lib, ... }:

{

  services.homebridge = {
    enable = true;
    user = "fv";
    settings = {
      bridge = {
        name = "Homebridge";
	username = "0E:1F:2A:3B:4C:5D";
        port = 51826;
	pin = "031-45-154";
      };
      
      description = "Homebridge en NixOs";

      accessories = [];

      platforms = [];
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

}
