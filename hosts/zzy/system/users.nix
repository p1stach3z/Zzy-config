
{ config, lib, pkgs, ... }:
{
  users.users.fv = {
    isNormalUser = true;
    extraGroups = [ "wheel" "floppy" "gamemode" "pipewire" "input" "audio" "video" "render" "seat" "rtkit" "polkituser" "systemd-resolve" "git" ];
  };
}
