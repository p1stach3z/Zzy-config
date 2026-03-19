{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "Zzy";

    networkmanager.enable = false;
    useDHCP = false;
    dhcpcd.enable = false;

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
    };
  };

  services.resolved = {
    enable = true;

    settings = {
      Resolve = {
        DNSOverTLS = "opportunistic";
        DNSSEC = "allow-downgrade";
        FallbackDNS = [
          "1.1.1.1"
          "8.8.8.8"
        ];
        # Si quieres conservar el comportamiento actual:
        LLMNR = true;
      };
    };
  };
}
