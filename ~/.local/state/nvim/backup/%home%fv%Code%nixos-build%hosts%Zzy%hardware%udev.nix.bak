{ config, lib, pkgs, ... }:

{
  
  services.udev.extraRules = ''
    # Backlight control.
    SUBSYSTEM=="backlight", ACTION=="add", \
      RUN+="chgrp video /sys/class/backlight/amdgpu_bl1/brightness", \
      RUN+="chmod g+w /sys/class/backlight/amdgpu_bl1/brightness"
 
    # Storage scheduler.
    ACTION=="add|change", KERNEL=="nvme0n1*", ATTR{queue/scheduler}="none"
  
    # Network card MTU and queue length.
    ACTION=="add", SUBSYSTEM=="net", KERNEL=="wl*", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000"
  '';

}
