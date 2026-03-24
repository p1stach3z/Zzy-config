{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    tealdeer
    fd
    lf
    w3m
    fastfetch
    inetutils
    nmap
  ];

}
