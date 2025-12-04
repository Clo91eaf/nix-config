{ inputs, ... }:
{
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "-L" # print log of what was changed
    ];
    dates = "04:00";
    randomizedDelaySec = "45min";
  };
}
