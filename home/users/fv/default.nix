
{ config, pkgs, lib, specialArgs, ... }:
{
  imports = [
    ./core
    ./programs
    ./desktop
    ./systemd
    ./packages.nix
  ];

  home.username = "fv";
  home.homeDirectory = "/home/fv";
  home.stateVersion = "24.11";

  systemd.user.startServices = "sd-switch";
}
