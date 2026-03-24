{ config, lib, pkgs, ... }:

{
  networking = {
    nameservers = [ "1.1.1.1" "1.0.0.1" "9.9.9.9" ];
    hostName = "Zzy";

    networkmanager.enable = false;
    useDHCP = false;
    dhcpcd.enable = false;
    wireless.enable = false;

    wireless.iwd = {
      enable = true;
      settings = {
        General = {
          EnableNetworkConfiguration = true;
        };

        Network = {
          NameResolvingService = "systemd";
          EnableIPv6 = false;
        };

        Settings = {
          AutoConnect = true;
        };
      };
    };

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 8581 51826 ];
      allowedUDPPorts = [ 5353 51826 ];
    };
  };

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSOverTLS = "opportunistic";
        DNSSEC = "allow-downgrade";
        LLMNR = true;
        FallbackDNS = [
          "1.1.1.1"
	        "1.0.0.1"
          "9.9.9.9"
        ];
        
        domains = [ "~." ];
      
      };
    };
  };
}
