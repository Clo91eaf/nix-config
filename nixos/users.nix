{ username, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.${username} = {
      isNormalUser = true;
      home = "/home/${username}";
      password = "a";
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
