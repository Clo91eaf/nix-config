{ pkgs, ... }:
{
  ##################################################################################################################
  #
  # All Clo91eaf's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix

    ../../home/programs
    # ../../home/shell
  ];

  programs.git.settings.user = {
    name = "Clo91eaf";
    email = "clo91eaf@qq.com";
  };
}
