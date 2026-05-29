let
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGgUmriXoeSXvmXOzC1ov+PRnUuZF1Uy0LLkgEntTvrt clo91eaf@qq.com";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILEXNt4d/fkiDWEEOpggLANrQHFTtG8cABvCgvGFO6iR root@rtx5070";
in
{
  "secret.age".publicKeys = [ user system ];
}