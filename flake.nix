{
  description = "My System Flake Config";

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
  };

  outputs = { self, nixpkgs, home-manager, disko, nixvim }@inputs: 
    let
      system = "x86_64-linux";
    in
  {
    nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
        ./hosts/laptop/configuration.nix
        disko.nixosModules.disko
      ];
    };
    homeConfigurations.matt = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home-manager/home.nix ];
    };
  };
}

