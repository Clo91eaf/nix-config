{
  lib,
  pkgs,
  catppuccin-bat,
  ...
}: {
  home.packages = with pkgs; [
    # fetch
    wget
    curl

    # archives
    zip
    unzip

    # utils
    git
    ripgrep
    htop
    direnv

    # shells
    fastfetch
    openvpn

    # Editor
    vim
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        sdras.night-owl
        bbenoist.nix
        vscodevim.vim
        mkhl.direnv
        github.copilot
        github.copilot-chat
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
      ];
    })

    # Browser
    firefox

    # Network
    clash-verge-rev

    # Communication
    telegram-desktop
  ];

  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "Full";
          opacity = 0.9;
        };
        font.normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
      };
      theme = "tokyo_night";
    };

    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      extraConfig = "mouse on";
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "catppuccin-mocha";
      };
      themes = {
        # https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme
        catppuccin-mocha = {
          src = catppuccin-bat;
          file = "Catppuccin-mocha.tmTheme";
        };
      };
    };

    # shell
    bash.enable = true;
    atuin.enable = true; # shell history
    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh = {
      enable = true; # ssh
      extraConfig = "Host 172.24.5.184\nHostName 172.24.5.184\nUser clo91eaf";
    };
  };
}
