{
  inputs,
  pkgs,
  lib,
  username,
  ...
}:
{
  # ============================= User related =============================

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    password = "a";
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
  };
  users.mutableUsers = false;

  # customise /etc/nix/nix.conf declaratively via `nix.settings`
  nix.settings = {
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
    ];

    trusted-public-keys = [ "cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
    trusted-users = [
      "root"
      username
    ];
    builders-use-substitutes = true;
  };

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    # do not gc generations
    options = lib.mkDefault "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        (fcitx5-rime.override {
          rimeDataPkgs = [
            rime-data
            rime-wanxiang
          ];
        })
      ];
      settings = {
        inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "rime";
          };
          "Groups/0/Items/0".Name = "rime";
        };
      };
    };
  };

  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      # program fonts
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif CJK SC"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Noto Sans CJK SC"
        "Noto Color Emoji"
      ];
      monospace = [
        "Noto Sans Mono CJK SC"
        "Noto Color Emoji"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # Enable networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
    hosts."127.0.0.1" = [
      # Block this domain to prevent QQ from auto-updating.
      "qqpatch.gtimg.cn"
    ];
  };

  environment = {
    variables = {
      # set the default editor to vim
      EDITOR = "vim";
      VISUAL = "vim";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };

  services = {
    xserver.enable = true;

    displayManager = {
      sddm.enable = true;
      autoLogin = {
        enable = true;
        user = username;
      };
    };

    openvpn.servers = {
      clo91eaf2 = {
        config = " config /etc/openvpn/client/clo91eaf2.conf ";
      };
    };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "esc";
              esc = "capslock";
              # https://github.com/rvaiya/keyd/issues/209#issuecomment-1121386837
              rightshift = "rightshift";
              rightcontrol = "rightcontrol";
            };
          };
        };
      };
    };
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # vpn
  services.mihomo.tunMode = true;
  programs.clash-verge = {
    enable = true;
    tunMode = true;
    serviceMode = true;
  };

  programs.niri.enable = true;

  # noctalia shell
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];
}
