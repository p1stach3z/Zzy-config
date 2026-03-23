{ config, pkgs, lib, ... }:

{

  programs.obsidian = {
    enable = true;
    vaults = {
      SecondBrain = {
        enable = true;
	target = "Files/Obsidian/SecondBrain";
      };
    };
    
  };

}
