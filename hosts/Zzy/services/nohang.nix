{ config, pkgs, lib, ... }:

{

  services.nohang = {
    enable = true;
    package = with pkgs; [ nohang-desktop ];
  };

}
