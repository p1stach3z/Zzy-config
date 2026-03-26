{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    curl
    libnotify
    tealdeer
    fd
    lf
    w3m
    fastfetch
    inetutils
    nmap
    nvtopPackages.amd
    man-db
    man-pages
    xdg-utils

    vlc
    wev


    kdePackages.qtsvg
    okular
    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.kio-fuse
    kdePackages.kdegraphics-thumbnailers
    
    file
    ark
    shared-mime-info
    libimobiledevice
    ifuse
    libplist
  ];

}
