{ config, pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignoreboth" ];
    historySize = 15000;

    profileExtra = ''
    '';

    initExtra = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
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
