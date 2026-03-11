
{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./hardware/disks.nix
    ./cachix.nix

    ./system/nix.nix
    ./system/boot-kernel.nix
    ./system/locale-console.nix
    ./system/networking.nix
    ./system/security.nix
    ./system/power.nix
    ./system/users.nix
    ./system/fonts.nix
    ./system/packages.nix

    ./hardware/amd-gpu-rocm.nix

    ./services/journald.nix
    ./services/pipewire.nix
    ./services/ollama.nix
    ./services/ananicy.nix
    ./services/lact-coolercontrol.nix
    ./services/display.nix

    ./desktop/plumbing.nix

    ./programs/niri-uwsm.nix
    ./programs/steam-gaming.nix
  ];

  system.stateVersion = "25.05";
}
