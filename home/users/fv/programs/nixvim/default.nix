{ config, lib, pkgs, ... }:

{

  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    clipboard.providers.wl-copy.enable = true;

    waylandSupport = true;
    withNodeJs = true;
    withPerl = true;
    withPython3 = true;
    withRuby = true;

  };

}
