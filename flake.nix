{
  description = "NixOS configuration of Clo91eaf";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    extra-substituters = [ "https://nix-community.cachix.org" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Zed is pinned to the nixpkgs revision whose zed-editor is 1.12.0, because
    # the patches in home/editor/ are audited against that version. Everything
    # else keeps following `nixpkgs` (unstable). Bump this revision deliberately
    # when you want a newer Zed (and re-audit the patches).
    zed-nixpkgs.url = "github:NixOS/nixpkgs/0954f7ee2f6bb3dc7d4e3d0d8bcb8fd4bde4cfc5";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed-extensions = {
      url = "github:DuskSystems/nix-zed-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    scala3-bsp-semantic-ls-zed = {
      url = "github:xinpian-tech/scala3-bsp-semantic-ls-zed";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.zed-extensions.follows = "zed-extensions";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      agenix,
      ...
    }:
    {
      nixosConfigurations.desktop =
        let
          username = "Clo91eaf";

          mylib = import ./mylib/utils.nix { inherit (nixpkgs) lib; };

          specialArgs = {
            inherit username mylib inputs;
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

            agenix.nixosModules.default
          ];
        };
    };
}
