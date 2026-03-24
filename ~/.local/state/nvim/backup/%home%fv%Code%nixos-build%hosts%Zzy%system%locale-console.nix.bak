
{ config, lib, pkgs, ... }:
{
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    earlySetup = true;
    font = "ter-122b";
    keyMap = "la-latin1";
    packages = [ pkgs.terminus_font ];
  };
}
