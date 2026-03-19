{ config, lib, pkgs, specialArgs, ... }:

{
  
  nixpkgs = {
    config.allowUnfree = true;
  };

  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;

      max-jobs = "auto";
      cores = 0;

      keep-outputs = false;
      keep-derivations = false;
    }; 
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

}
