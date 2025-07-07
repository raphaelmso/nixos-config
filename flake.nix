{

  description = "Initial flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";

    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      plasma-manager,
      stylix,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        forge = lib.nixosSystem {
          inherit system;
          modules = [
            stylix.nixosModules.stylix
            ./hosts/forge/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        raphael = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            plasma-manager.homeManagerModules.plasma-manager
            stylix.homeModules.stylix
            ./home/home.nix
          ];
        };
      };
    };
}
