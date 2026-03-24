{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    git
    wget
    tealdeer
    fd
    lf
    w3m
    fastfetch
    inetutils
    nmap
    nix-index
  ];

}
