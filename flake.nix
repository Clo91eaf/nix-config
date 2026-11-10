{
  description = "NixOS configuration of Clo91eaf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # https://yet.nixoscn.org/
    nixpkgs-yet.url = "github:NixOS/nixpkgs/1d060086d60cb76a40cf37109f979d88a5bd6396";
    # https://github.com/llvm/circt/issues/11509
    clash-verge-nixpkgs.url = "github:NixOS/nixpkgs/02a1ce73fa5f0021971b47e5d916066f2450b56d";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake/pull/20/head"; # https://github.com/youwen5/zen-browser-flake/pull/20
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fcitx5-mellow-themes = {
      url = "github:sanweiya/fcitx5-mellow-themes";
      flake = false;
    };
    phono-fcitx5-addon = {
      url = "github:phono-project/phono-fcitx5-addon/main";
      flake = false;
    };
    scala3-bsp-semantic-ls-zed = {
      url = "github:xinpian-tech/scala3-bsp-semantic-ls-zed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      agenix,
      ...
    }:
    let
      username = "Clo91eaf";
      hostname = "desktop";

      mylib = import ./mylib/utils.nix { inherit (nixpkgs) lib; };

      specialArgs = {
        inherit
          username
          hostname
          mylib
          inputs
          ;
      };

    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";

        # module organization of the configuration files
        # nix-config
        # +-- hosts/<hostname>   machine-specific (hardware + host settings)
        # +-- nixos              generic system modules
        # +-- home               home-manager modules
        # +-- users/<username>   per-user nixos + home entrypoints
        modules = [
          ./hosts/${hostname}

          ./users/${username}/nixos.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = specialArgs;
              backupFileExtension = "backup";
              users.${username} = import ./users/${username}/home.nix;
            };
          }

          agenix.nixosModules.default
        ];
      };
    };
}
