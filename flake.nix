{
  description = "My system flake config";

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
  };

  outputs = { self, nixpkgs, home-manager, disko, ... }@inputs: let
    system = "x86_64-linux";
    nixosVersion = "25.05";
    homeStateVersion = nixosVersion;
    user = "matt";
    
    hosts = [
      { hostname = "nixos-laptop"; stateVersion = nixosVersion; }
      { hostname = "nixos-server"; stateVersion = nixosVersion; }
    ];

    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { 
        inherit inputs stateVersion hostname user;
      };
      modules = [ 
        ./hosts/${hostname}/configuration.nix
        disko.nixosModules.disko
      ];
    };
  in {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem { inherit (host) hostname stateVersion; };
      }) {} hosts;

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit inputs homeStateVersion user;
        #hostname = "nixos-laptop";  # HARDCODED FOR NOW, CHANGE
        hostname = "nixos-server";  # EDIT
      };
      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}