
{ config, lib, pkgs, ... }:
{
  powerManagement.enable = true;

  # TLP vs power-profiles-daemon: no mezclar.
  services.power-profiles-daemon.enable = false;
  
  powerManagement.powertop.enable = true;

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "auto";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "poweroff";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "ignore";
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };

  services.fstrim.enable = true;
}
