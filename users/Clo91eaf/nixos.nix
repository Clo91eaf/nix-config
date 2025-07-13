{ pkgs, ... }: {
  ##################################################################################################################
  #
  # NixOS Configuration
  #
  ##################################################################################################################

  programs.zsh.enable = true;

  users.users.Clo91eaf = {
    # Clo91eaf's authorizedKeys
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCr+IMqnTsj1iDxjdjXFijrLRUovpt5tv8yNgc2JDg3BeHVNvxWz2asm0A6T0ysO+dX/GbfRoLXEpbO5dsc0Cazi4SgXn3T16N/RUzzXZLGAs6AYAHq5s2IoAdFB/jvOHhY+W/yI5XCedT6oAfYFDv4BODRgLEHRU+cFvrS6V+U3OoVJYpg+12xgByBVmshZ8+8qLEZOd/CckyC8UwKfetocP9Y9gonTzyPYgEUVxcA1QBCjHFVmPwX63HL0rnxjSvwzESGGgKnchuMujQbH5wF0G+rqXHU04w84uzWa/L3AidNaA8Kxl5ZRH5L/RdXRA9YmHhY6Bc7yteFy6HDkt/7dAor7XrpHAI3EORQEfxPX0Diur9lQjZ131A+F5scmd826K8nXJJ4lLEQid5AZK14Q2QkcTPEAVzfwhoXBqKk9vnc/SX781SpovFu6fH3txeWS6gSuwdG6bAsdvIvvNJopn1x/daIpxhhg03JOOHJvCYgh6wi4XoiI5P8J2OdG7ATjPcuepQF/1Gj72FecCXD/PdCw9ZJkdZoSaKijLZXpVOKOJFq2NpkAI+POEIrJOzy73ho4z6204BHnNyHcj7qjNmhyeAjmqDi13YXnNSr1jxySe61mW/kiP3QtDkcAT5PW9iKI6pKwnM2Wnhc7N8gUvPhtnYCUn6ijS12wvg0eQ== clo91eaf@qq.com"
    ];

    shell = pkgs.zsh;
  };
}
