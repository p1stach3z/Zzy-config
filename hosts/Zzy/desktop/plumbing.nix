{ config, lib, pkgs, ... }:

{
  services.dbus = {
    enable = true;
    implementation = "broker";
  };

  services.seatd = {
    enable = true;
    group = "seat";
  };

  services.libinput.enable = true;
  services.udisks2.enable = true;
  services.usbmuxd.enable = true;

  services.envfs.enable = true;
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

}
