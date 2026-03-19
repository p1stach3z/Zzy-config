{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "Zzy";

    # No usaremos NetworkManager en esta arquitectura
    networkmanager.enable = false;

    # Evitamos DHCP global y por interfaz:
    # iwd hará la configuración de red por netconfig.
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

    # Compatibilidad razonable para red doméstica
    llmnr = "true";

    # Tu router no soporta DNSSEC completo, así que esto evita romper resolución
    dnssec = "allow-downgrade";

    # Intenta DoT, pero baja de nivel si el DNS upstream no lo soporta
    dnsovertls = "opportunistic";

    fallbackDns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };
}
