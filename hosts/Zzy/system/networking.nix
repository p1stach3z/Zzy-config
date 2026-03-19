
{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "Zzy";
    dhcpcd.enable = false;
    networkmanager = {
      enable = false;
      };
    wireless = {
      enable = false;
      iwd = {
        enable = true;
	settings = {
          General = {
	    EnableNetworkConfiguration = true;
	  };
	  Network ={
            EnableIPv6 = true;
	    NameResolvingService = "systemd";
	    RoutePriorityOffset = 300;
	  };
	  Settings = {
            AutoConnect = true;
	  };
	};
      };
    };
    
    interfaces.wlan0.useDHCP = true;
    firewall.enable = true;
  };
    

  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    dnsovertls = "opportunistic";
    fallbackDns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    domains = [ "~." ];
  };

}
