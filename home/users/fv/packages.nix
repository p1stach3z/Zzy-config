{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    git
    wget
    tealdeer
    fd
    lf
    w3m
  ];

  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
  };
}
