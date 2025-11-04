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
        l = "eza --icons";
        ls = "eza --icons";
        ll = "eza --icons --group --group-directories-first --long --git";
        lg = "eza --icons --group --group-directories-first --long --git --git-ignore";
        le = "eza --icons --group --group-directories-first --long --extended";
        lt = "eza --icons --group --group-directories-first --tree";
        lc = "eza --icons --group --group-directories-first --across";
        lo = "eza --icons --group --group-directories-first --oneline";
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
        background-opacity = 0.9;
        theme = "catppuccin-mocha";
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
  };
}
