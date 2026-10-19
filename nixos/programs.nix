_: {
  programs = {
    ssh.enableAskPassword = false;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    # vpn
    clash-verge = {
      enable = true;
      tunMode = true;
      serviceMode = true;
    };

    # niri
    niri.enable = true;
  };
}
