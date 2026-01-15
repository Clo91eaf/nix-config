{
  description = "NixOS configuration of Clo91eaf";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    extra-substituters = [ "https://nix-community.cachix.org" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.desktop =
        let
          username = "Clo91eaf";

          mylib = import ./mylib/utils.nix { inherit (nixpkgs) lib; };

          specialArgs = {
            inherit username mylib inputs;
            pkgs-stable = import nixpkgs-stable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          # module organization of the configuration files
          # nix-config
          # +-- hardware
          # +-- software
          #     +-- nixos <----------+
          #     +-- home <-----------+-+
          #     +-- users<username>  | |
          #         +-- nixos  ------+ |
          #         +-- home ----------+

          modules = [
            ./hardware # hardware

            ./users/${username}/nixos.nix # user-nixos

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = specialArgs;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${username} = import ./users/${username}/home.nix; # user-home
            }
          ];
        };
    };
}
