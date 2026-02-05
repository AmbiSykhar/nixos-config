{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    systems.url = "github:nix-systems/default-linux";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    systems,
    niri-flake,
    ...
  } @ inputs :
  let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
  in {
    inherit lib;
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });

    nixosConfigurations = {
      "dragon" = lib.nixosSystem {
        modules = [ ./hosts/dragon ];
        specialArgs = { inherit inputs outputs; };
      };
      "ambi-laptop" = lib.nixosSystem {
        modules = [ ./hosts/ambi-laptop ];
        specialArgs = { inherit inputs outputs; };
      };
    };

    homeConfigurations = {
      "ambi@dragon" = lib.homeManagerConfiguration {
        modules = [ ./home/ambi/dragon.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      "ambi@ambi-laptop" = lib.homeManagerConfiguration {
        modules = [ ./home/ambi/ambi-laptop.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      "zygan@ambi-laptop" = lib.homeManagerConfiguration {
        modules = [ ./home/zygan/ambi-laptop.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
  };
}

