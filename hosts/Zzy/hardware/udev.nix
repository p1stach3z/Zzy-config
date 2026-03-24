{ config, lib, pkgs, ... }:

{
  
  services.udev.extraRules = ''
    # Backlight control.
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl1", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness" 
 
    # Storage scheduler.
    ACTION=="add|change", KERNEL=="nvme0n1*", ATTR{queue/scheduler}="none"
  
    # Network card MTU and queue length.
    ACTION=="add", SUBSYSTEM=="net", KERNEL=="wl*", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000"
  '';

}
