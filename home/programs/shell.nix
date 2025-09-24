{ pkgs, ... }:
{
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

      zplug = {
        enable = true;
        plugins = [ { name = "zsh-users/zsh-autosuggestions"; } ];
      };
      oh-my-zsh = {
        # "ohMyZsh" without Home Manager
        enable = true;
        plugins = [ "git" ]; # for some git aliases
      };
    };

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
  };
}
