{ username, ... }:
{
  nix = {
    # customise /etc/nix/nix.conf declaratively via `nix.settings`
    settings = {
      # enable flakes globally
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];

      substituters = [
        # cache mirror located in China
        # status: https://mirror.sjtu.edu.cn/
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        # status: https://mirrors.ustc.edu.cn/status/
        # "https://mirrors.ustc.edu.cn/nix-channels/store"

        "https://cache.nixos.org"

        # nix community's cache server
        "https://nix-community.cachix.org/"
      ];

      trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
      trusted-users = [ username ];
      builders-use-substitutes = true;
    };

    # do garbage collection monthly to keep disk usage low
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };

    # Hardlink identical files (btrfs-friendly) periodically to save space.
    optimise.automatic = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
