{

  description = "Initial flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
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
            ./hosts/forge/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        raphael = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./user/home.nix
          ];
        };
      };
    };
}
