
{ config, lib, pkgs, ... }:
{
  
  boot = {
    
    kernel.sysctl = {
      "kernel.kptr_restrict" = 2;
      "kernel.dmesg_restrict" = 1;
    };

    loader = {
      timeout = 5;
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
      };
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" "usbhid" ];
      kernelModules = [ "amdgpu" "ideapad_laptop" ];
    };
    # Laptop: S0ix + AMD P-state
    extraModulePackages = with config.boot.kernelPackages; [
      zenpower
    ];
    kernelModules = [ "kvm-amd" "zenpower" ];
    kernelParams = [
      "mem_sleep_default=s2idle"
      "amd_pstate=active"
      "psmouse.synaptics_intertouch=0"
      "amdgpu.vm_fragment_size=9"
    ];
    blacklistedKernelModules = [ "k10temp" ];

    # Normalmente deja el kernel default (más caché, menos rebuilds).
    # kernelPackages = pkgs.linuxPackages_latest;
  };
}
