{ lib, pkgs, catppuccin-bat, ... }: {
  home.packages = with pkgs; [
    # nix
    nixfmt-classic

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

    # connects
    openvpn
    tigervnc

    # editor
    vim
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        eamodio.gitlens
        github.copilot
        github.copilot-chat
        mkhl.direnv
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        sdras.night-owl
        vscodevim.vim
        vspacecode.whichkey
      ];
    })

    # browser
    firefox

    # communication
    telegram-desktop
    wemeet

    # music
    go-musicfox

    # entertainment
    ttyper
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

      shortcut = "a";
      extraConfig = ''
        set -g default-terminal "xterm-256color"
        set-option -g mouse on

        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        bind n new-window -c "#{pane_current_path}"
      '';
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
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ff = "fastfetch --config examples/10.jsonc";
      };

      zplug = {
        enable = true;
        plugins = [{ name = "zsh-users/zsh-autosuggestions"; }];
      };
      oh-my-zsh = { # "ohMyZsh" without Home Manager
        enable = true;
        plugins = [ "git" ]; # for some git aliases
      };
    };
    starship.enable = true; # A package manager for the shell
    atuin.enable = true; # shell history
    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh = {
      enable = true; # ssh
      extraConfig = ''
        Host 172.24.5.184
        HostName 172.24.5.184
        User clo91eaf
        
        Host 172.24.6.56
        HostName 172.24.6.56
        User clo91eaf
      '';
    };
  };
}
