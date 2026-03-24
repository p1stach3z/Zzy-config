{ config, lib, pkgs, ... }:

{
  
  services.udev.extraRules = ''
    # Backlight control.
    SUBSYSTEM=="backlight", ACTION=="add", \
      RUN+="/usr/bin/chgrp video /sys/class/backlight/amdgpu_bl0/brightness", \
      RUN+="/usr/bin/chmod g+w /sys/class/backlight/amdgpu_bl0/brightness"
 
    # Storage scheduler.
    ACTION=="add|change", KERNEL=="nvme0n1*", ATTR{queue/scheduler}="none"
  
    # Network card MTU and queue length.
    ACTION=="add", SUBSYSTEM=="net", KERNEL=="wl*", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000"
  '';

}
