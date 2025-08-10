{
  description = "My unified NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, disko, nixos-wsl, ... }@inputs:
    let
      system = "x86_64-linux";
      stateVersion = "25.05";
      
      # Define all hosts with their specific attributes
      hosts = {
        "nixos-laptop" = {
          user = "matt";
          system = system;
        };
        "nixos-server" = {
          user = "matt";
          system = system;
        };
        # WSL
        "nixos" = {
          user = "nixos";
          system = system;
          wsl = true;
        };
      };

      # Helper function to create NixOS configurations
      mkHost = hostname: hostAttrs:
        nixpkgs.lib.nixosSystem {
          system = hostAttrs.system;
          specialArgs = {
            inherit inputs system stateVersion hostname;
            user = hostAttrs.user;
          };
          modules = [
            # Base modules
            ./hosts/${hostname}
            # Only include disko for non-WSL systems
            (if !(hostAttrs.wsl or false) then disko.nixosModules.disko else {})
          ] 
          # Add WSL module if needed
          ++ (if hostAttrs.wsl or false then [nixos-wsl.nixosModules.default] else []);
        };

      # Helper function for home-manager configurations
      mkHome = hostname: hostAttrs:
        let 
          username = hostAttrs.user; 
        in 
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${hostAttrs.system};
          extraSpecialArgs = {
            inherit inputs system hostname;
            user = username;
            homeStateVersion = stateVersion;
          };
          modules = [
            ./hosts/${hostname}/home.nix
          ];
        };
    in {
      # Generate all NixOS configurations
      nixosConfigurations = nixpkgs.lib.mapAttrs mkHost hosts;

      # Generate all home-manager configurations
      homeConfigurations = nixpkgs.lib.mapAttrs 
        (hostname: hostAttrs: mkHome hostname hostAttrs) hosts;
    };
}