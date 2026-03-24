{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    linux-firmware
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
    nodejs
    net-tools
    acpi_call
  ];
}
