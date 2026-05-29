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
  
  age.secrets.secret.file = ../../secrets/secret.age;

  users.users.Clo91eaf = {
    # Clo91eaf's authorizedKeys
    hashedPasswordFile = config.age.secrets.secret.path;

    shell = pkgs.zsh;
  };
}
