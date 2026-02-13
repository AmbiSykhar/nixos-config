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
      "wyvern" = lib.nixosSystem {
        modules = [ ./hosts/wyvern ];
        specialArgs = { inherit inputs outputs; };
      };
      "basilisk" = lib.nixosSystem {
        modules = [ ./hosts/basilisk ];
        specialArgs = { inherit inputs outputs; };
      };
    };

    homeConfigurations = {
      "ambi@dragon" = lib.homeManagerConfiguration {
        modules = [ ./home/ambi/dragon.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };

      "ambi@wyvern" = lib.homeManagerConfiguration {
        modules = [ ./home/ambi/wyvern.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      "zygan@wyvern" = lib.homeManagerConfiguration {
        modules = [ ./home/zygan/wyvern.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      "vivi@wyvern" = lib.homeManagerConfiguration {
        modules = [ ./home/vivi/wyvern.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };

      "ambi@basilisk" = lib.homeManagerConfiguration {
        modules = [ ./home/ambi/basilisk.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      "vivi@basilisk" = lib.homeManagerConfiguration {
        modules = [ ./home/vivi/basilisk.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      "zygan@basilisk" = lib.homeManagerConfiguration {
        modules = [ ./home/zygan/basilisk.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
  };
}

