
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
      nixcheck = "git -C ~/Code/nixos-build status && nix flake check ~/Code/nixos-build && sudo nixos-rebuild dry-build --flake ~/Code/nixos-build#Zzy";
      nixswitch = "sudo nixos-rebuild switch --flake ~/Code/nixos-build#Zzy";
      nixupdate = "cd ~/Code/nixos-build && git add . && (git diff --cached --quiet || git commit -m \"update: $(date +%F-%H%M)\") && git push && sudo nixos-rebuild switch --flake .#Zzy";
      flakedit = "nvim ~/Code/nixos-build/flake.nix";

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
