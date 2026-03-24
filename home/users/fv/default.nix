
{ config, pkgs, lib, specialArgs, ... }:
{
  imports = [
    inputs.nix-index-database.homeModules.nix-index
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

  programs.nix-index = {
    enable = true;
    enableBashIntegration = true; # o zsh/fish según uses
  };
}
