{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # system
    grub2

    # fetch
    wget
    curl

    # archives
    zip
    unzip
    unrar

    # utils
    ripgrep
    ttyper
    gh-dash

    btop
    jq
    wpsoffice-cn

    # connects
    openvpn
    tigervnc

    # editor
    vim
  ];

  programs = {
    starship.enable = true;
    atuin.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ff = "fastfetch";
        win = "sudo grub-reboot 1 && reboot";
        upd = "sudo nixos-rebuild switch --flake ~/nix-config#nixos";
      };
    };

    ghostty = {
      enable = true;
      settings = {
        font-size = 12;
        font-family = "FiraCode Nerd Font";
        theme = "Catppuccin Mocha";
        mouse-hide-while-typing = true;
        scrollback-limit = 16384;
        background-opacity = 0.7;
        window-decoration = "none";
      };
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
        theme = "Catppuccin Mocha";
      };
    };

    ssh = {
      enable = true; # ssh

      # evaluation warning: Clo91eaf profile: `programs.ssh` default
      # values will be removed in the future.
      # Consider setting `programs.ssh.enableDefaultConfig` to false,
      # and manually set the default values you want to keep at
      # `programs.ssh.matchBlocks."*"`.
      enableDefaultConfig = false;
      matchBlocks."*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };

      # add custom hosts for plct
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
