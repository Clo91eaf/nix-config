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

    btop
    jq
    eza

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
        upd = "sudo nixos-rebuild switch --flake ~/nix-config#desktop --impure";
        ls = "eza --group-directories-first --icons=always --color=auto";
        ll = "eza --group-directories-first --icons=always --color=auto -lh";
        la = "eza --group-directories-first --icons=always --color=auto -lha";
        lt = "eza --group-directories-first --icons=always --color=auto -T";
        llt = "eza --group-directories-first --icons=always --color=auto -lT";
      };
    };
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Catppuccin Mocha";
      };
    };

    # ~/.ssh/config
    ssh = {
      enable = true; # ssh client config
      enableDefaultConfig = false;
      settings."*" = { };

      # private hosts are stored in /run/agenix/ssh-config (decrypted at runtime)
      extraConfig = "Include /run/agenix/ssh-config";
    };
  };
}
