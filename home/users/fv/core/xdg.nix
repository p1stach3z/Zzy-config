
{ config, pkgs, lib, ... }:
{
  xdg.enable = true;

  home.sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];

  xdg.configFile."user-dirs.dirs".text = ''
    XDG_DESKTOP_DIR="$HOME/Files/Desktop"
    XDG_DOWNLOADS_DIR="$HOME/Downloads"
    XDG_TEMPLATES_DIR="$HOME/Code"
    XDG_PUBLICSHARE_DIR="$HOME/Code"
    XDG_DOCUMENTS_DIR="$HOME/Files"
    XDG_MUSIC_DIR="$HOME/Media/music"
    XDG_PICTURES_DIR="$HOME/Media/pictures"
    XDG_VIDEOS_DIR="$HOME/Media/videos"
  '';
}
