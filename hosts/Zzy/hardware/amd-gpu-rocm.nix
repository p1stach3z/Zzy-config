
{ config, lib, pkgs, ... }:
{
  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd = {
      ryzen-smu.enable = true;
      updateMicrocode = true;
      };
    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
      overdrive = {
        enable = true;
        ppfeaturemask = "0xffffffff";
      };
    };

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        mesa
        libvdpau-va-gl
        rocmPackages.clr
        rocmPackages.clr.icd
        rocmPackages.amdsmi
      ];
    };

    i2c.group = "i2c";
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    brillo.enable = true;
  };

  services.blueman.enable = true;

  # /opt/rocm para apps que lo esperan.
  systemd.tmpfiles.rules =
    let
      rocmEnv = pkgs.symlinkJoin {
        name = "rocm-combined";
        paths = with pkgs.rocmPackages; [ rocblas hipblas clr ];
      };
    in [
      "L+ /opt/rocm - - - - ${rocmEnv}"
    ];

  services.fwupd.enable = true;
}
