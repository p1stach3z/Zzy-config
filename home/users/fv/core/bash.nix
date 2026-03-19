
{ config, pkgs, lib, ... }:
{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignoreboth" ];
    historySize = 15000;

    profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ] && [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ]; then
        if command -v uwsm >/dev/null 2>&1; then
          while true; do
            uwsm select || break
            uwsm start default || true
          done
        fi
      fi
    '';

    # sin hacks de sesión aquí
    initExtra = ''
    '';

    bashrcExtra = ''
      set -o noclobber
      bind '"\e[A": history-search-backward'
      bind '"\e[B": history-search-forward'
      shopt -s autocd
    '';

    shellAliases = {
      rebuild = "sudo nixos-rebuild --flake /home/fv/Code/nixos-build#Zzy switch";
      flakedit = "nvim /home/fv/Code/nixos-build/flake.nix";

      ls = "eza";
      lsa = "eza -a";
      lsl = "eza -al";
      lst = "eza -lTa -L 2";
      lstx = "eza -lTa -L 4";

      rm = "rm -i";
      cp = "cp -i";
      mkdir = "mkdir -pv";

      diff = "kitty +kitten diff";
      
      wtf = "tldr";
    };
  };
}
