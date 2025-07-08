{
  description = "Nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-darwin.url = "github:LnL7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };
  };
  
  outputs = { self, nixpkgs, nix-darwin, home-manager, lix, lix-module }: {

    

    nixosConfigurations.Discovery = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        lix-module.nixosModules.default
        home-manager.nixosModules.home-manager
        ./systems/discovery.nix
      ];
    };

    nixosConfigurations.Stargazer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        lix-module.nixosModules.default
        home-manager.nixosModules.home-manager
        ./systems/stargazer.nix
      ];
    };

    darwinConfigurations.Voyager = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        lix-module.nixosModules.default
        home-manager.darwinModules.home-manager
        ./systems/voyager.nix 
      ];
    };

    darwinPackages = self.darwinConfigurations.Voyager.pkgs;

    packages.x86_64-linux.installer-iso = self.nixosConfigurations.installer-iso.config.system.build.isoImage;

    nixosConfigurations.installer-iso = (nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system-installer/configuration.nix
      ];
    });


    homeConfigurations."alia@Discovery" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./hm/discovery.nix 
        {wayland.windowManager.hyprland.enable = true;}
      ];
    };

    homeConfigurations."alia@articfops" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-darwin;
      modules = [ ./hm/nix-darwin.nix ]; 
    };
    
    homeConfigurations."alia@Voyager" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      modules = [ ./hm/nix-darwin.nix ]; 
    };

    homeConfigurations."alia@Stargazer" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ 
        ./hm/stargazer.nix 
        {wayland.windowManager.hyprland.enable = true;}
      ];
    };
  };
}

