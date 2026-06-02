let
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGgUmriXoeSXvmXOzC1ov+PRnUuZF1Uy0LLkgEntTvrt clo91eaf@qq.com";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILEXNt4d/fkiDWEEOpggLANrQHFTtG8cABvCgvGFO6iR root@rtx5070";
in
{
  "passwd.age".publicKeys = [
    user
    system
  ];
  "ssh-config.age".publicKeys = [
    user
    system
  ];
  "ovpn.age".publicKeys = [
    user
    system
  ];
}
