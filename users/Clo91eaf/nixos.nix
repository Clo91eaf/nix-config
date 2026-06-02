{ pkgs, config, ... }:
{
  ##################################################################################################################
  #
  # NixOS Configuration
  #
  ##################################################################################################################

  imports = [
    ../../nixos
  ];

  programs.zsh.enable = true;

  services.openssh.enable = true;

  age.secrets.passwd.file = ../../secrets/passwd.age;

  age.secrets.ssh-config = {
    file = ../../secrets/ssh-config.age;
    owner = "Clo91eaf";
    mode = "0400";
  };

  users.users.Clo91eaf = {
    # Clo91eaf's authorizedKeys
    hashedPasswordFile = config.age.secrets.passwd.path;

    shell = pkgs.zsh;
  };
}
