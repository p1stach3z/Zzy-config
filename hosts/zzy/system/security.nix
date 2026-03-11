
{ config, lib, pkgs, ... }:
{
  
  security = {
    polkit.enable = true;  # el agente corre en Home Manager (user)
    rtkit.enable = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  
  boot.kernel.sysctl = {
    # Desactivar redirects
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;

    # Desactivar source routing
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.default.accept_source_route" = 0;

    # TCP hardening
    "net.ipv4.tcp_syncookies" = 1;

    # IPv6 hardening
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
  };

}
