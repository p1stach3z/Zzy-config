{
  description = "My ideapad flake (modular)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, niri, nix-index-database, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.Zzy = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
          ({ ... }: {
            nixpkgs.overlays = [ inputs.niri.overlays.niri ];
          })

          nixos-hardware.nixosModules.lenovo-ideapad-slim-5
          ./hosts/Zzy

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = ".bak";
            home-manager.extraSpecialArgs = { inherit inputs; };

            home-manager.users.fv = import ./home/users/fv;
          }
          
          inputs.nix-index-database.homeModules.default
        
          inputs.niri.homeModules.default
        
        ];
      };
    };
}
