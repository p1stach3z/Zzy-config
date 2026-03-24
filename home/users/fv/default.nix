
{ config, pkgs, lib, specialArgs, ... }:
{
  imports = [
    nix-index-database.homeModules.nix-index
    ./core
    ./programs
    ./desktop
    ./systemd
    ./packages.nix
  ];

  home.username = "fv";
  home.homeDirectory = "/home/fv";
  home.stateVersion = "25.05";

  systemd.user.startServices = "sd-switch";
}
