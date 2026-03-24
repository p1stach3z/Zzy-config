{ config, lib, pkgs, ... }:

{
  
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl0", TAG+="uaccess", GROUP="video", MODE="0664"
  '';

}
