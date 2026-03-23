{ config, lib, pkgs, specialArgs, ... }:

{
  
  nixpkgs = {
    config.allowUnfree = true;
  };

  nix = {
    optimise.automatic = true;
    settings = {
      trusted-users = [ "root" "fv" "@wheel" ];

      substituters = [
        "https://cache.nixos.org"
        "https://devenv.cachix.org"
        "https://niri.cachix.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "p1stach3z.cachix.org-1:t/K90eb8XSJdWogS0T5rUiqqE2LUuTlo556qVNptw64="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    
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
