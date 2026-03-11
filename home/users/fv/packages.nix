
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devenv
    xwayland-satellite
    dialog
    libnotify
    clinfo
    swaybg
    fzf
    swappy
    grim
    slurp
    cliphist
    wl-clipboard
    brightnessctl
  ];
}
