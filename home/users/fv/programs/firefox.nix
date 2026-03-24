{ config, pkgs, lib, ... }: 

{ 

  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
  };

}
