{ username, ... }:
{
  users = {
    users.${username} = {
      isNormalUser = true;
      home = "/home/${username}";
      description = username;
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
      ];
    };
    mutableUsers = false;
  };
}
