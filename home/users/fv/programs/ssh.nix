{ config, pkgs, lib, ... }:

{

  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };

    extraConfig = ''
      AddKeysToAgent yes
    '';
  };

}
