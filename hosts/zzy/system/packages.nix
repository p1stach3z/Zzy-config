
{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    tealdeer
    fd
    lf
    w3m
    util-linux
    coreutils
    efibootmgr
    lm_sensors
    pavucontrol
    pciutils

    amdgpu_top
    vulkan-tools
    mesa-demos

    libimobiledevice
  ];
}
