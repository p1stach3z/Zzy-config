{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    util-linux
    coreutils
    efibootmgr
    lm_sensors
    pciutils
    amdgpu_top
    vulkan-tools
    mesa-demos
    libimobiledevice
    pavucontrol
  ];
}
