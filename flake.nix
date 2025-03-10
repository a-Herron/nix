{
  description = "Main flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, ...}: 
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
	  inherit system;
	  modules = [
	    ./configuration.nix
	  ];
        };
      };
      
      homeConfigurations = {
        austin = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [ ./home.nix ];
	};
      };
    };
}
