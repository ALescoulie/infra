{
  description = "Nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nix-darwin.url = "github:LnL7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager }: {
    nixosConfigurations.Discovery = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.home-manager
        ./systems/discovery.nix
      ];
    };

    darwinConfigurations.Voyager = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        ./systems/voyager.nix 
      ];
    };

    darwinPackages = self.darwinConfigurations.Voyager.pkgs;


    homeConfigurations."alia@Discovery" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ ./hm/discovery.nix ];
    };

    homeConfigurations."alia@articfops" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-darwin;
      modules = [ ./hm/nix-darwin.nix ]; 
    };
    
    homeConfigurations."alia@Voyager" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      modules = [ ./hm/nix-darwin.nix ]; 
    };
  };
}
