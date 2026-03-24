
{ config, lib, pkgs, ... }:
{
  
  boot = {
    
    kernelPackages = pkgs.linuxPackages_zen;

    kernel.sysctl = {
      "kptr_restrict" = 2;
      "dmesg_restrict" = 1;
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_background_bytes" = 4194304;
      "vm.dirty_bytes" = 4194304;
      "core_pattern" = false;
      "net.core.netdev_max_backlog" = 16384;
      "net.core.somaxconn" = 8192;
      "net.core.rmem_default" = 1048576;
      "net.core.rmem_max" = 16777216;
      "net.core.wmem_default" = 1048576;
      "net.core.wmem_max" = 16777216;
      "net.core.optmem_max" = 65536;
      "net.ipv4.tcp_rmem" = 4096;
      "net.ipv4.tcp_wmem" = 4096;
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
      "cfg80211.ieee80211_regdom=MX"
      "mt7921e.disable_aspm=1" 
    ];
    blacklistedKernelModules = [ "k10temp" ];
  
    };
}
