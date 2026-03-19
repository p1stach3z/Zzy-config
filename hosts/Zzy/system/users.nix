{ config, lib, pkgs, ... }:

{
  users.users.fv = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "render"
      "input"
      "seat"
      "i2c"
      "gamemode"
    ];
  };
}
