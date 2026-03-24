
{ config, lib, pkgs, ... }:
{
  
  boot = {
    
    kernelPackages = pkgs.linuxPackages_zen;

    kernel.sysctl = {
      "kernel.kptr_restrict" = 2;
      "kernel.dmesg_restrict" = 1;
      "kernel.vm.dirty_ratio" = 10;
      "kernel.vm.dirty_background_ratio" = 5;
      "kernel.vm.vfs_cache_pressure" = 50;
      "kernel.vm.dirty_background_bytes" = 4194304;
      "kernel.vm.dirty_bytes" = 4194304;
      "kernel.core_pattern" = false;
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
      kernelModules = [ "zenpower" "amdgpu" "ideapad_laptop" ];
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
  
    };
}
