{ config, lib, pkgs, ... }:

{
  
  services.psd = {
    enable = true;
    browsers = [ "firefox" ];
  };

}
