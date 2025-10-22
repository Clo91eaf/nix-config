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
