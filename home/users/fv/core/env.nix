
{ config, pkgs, lib, ... }:
{
  home.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";

    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";

    AMD_VULKAN_ICD = "RADV";
    ROCM_PATH = "/opt/rocm";
    RUSTICL_ENABLE = "radeonsi";

    QT_QPA_PLATFORM = "wayland";
  };

  manual.manpages.enable = true;
  news.display = "show";
}
