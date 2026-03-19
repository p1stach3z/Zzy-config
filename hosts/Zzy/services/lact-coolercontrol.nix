
{ config, lib, pkgs, ... }:
{
  programs.coolercontrol.enable = true;

  services.lact.enable = true;
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
