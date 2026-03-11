
{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "Zzy";
    interfaces.wlan0.useDHCP = lib.mkDefault true;
    nameservers = [ "127.0.0.53" ];
    networkmanager = {
      enable = false;
      };
    wireless = {
      enable = false;
      iwd = {
        enable = true;
	settings = {
          General = {
	    EnableNetworkConfiguration = false;
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

    dhcpcd.enable = true;
    firewall.enable = true;
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    fallbackDns = [
      "1.1.1.1#cloudflare-dns.com"
      "1.0.0.1#cloudflare-dns.com"
      "9.9.9.9#dns.quad9.net"
    ];
    domains = [ "~." ];
  };

}
