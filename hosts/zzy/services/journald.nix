
{ config, lib, pkgs, ... }:
{
  services.journald.extraConfig = ''
    Storage=persistent
    SystemMaxUse=1G
  '';

  systemd.oomd.enable = true;
  services.irqbalance.enable = true;
  services.smartd.enable = true; # si spamea con tu NVMe, apágalo
}
