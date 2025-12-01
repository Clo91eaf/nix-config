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
    fastfetch
    ttyper

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
      syntaxHighlighting.enable = true;

      shellAliases = {
        ff = "fastfetch --config examples/10.jsonc";
        win = "sudo grub-reboot 1 && reboot";
      };

      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.1";
            sha256 = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
          };
        }
        {
          name = "zsh-completions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-completions";
            rev = "0.35.0";
            sha256 = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
          };
        }
      ];
    };

    ghostty = {
      enable = true;
      settings = {
        font-size = 12;
        font-family = "FiraCode Nerd Font";
        theme = "Catppuccin Mocha";
        mouse-hide-while-typing = true;
        scrollback-limit = 16384;
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
        theme = "catppuccin-mocha";
      };
    };

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
