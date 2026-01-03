{ pkgs, ... }:
{
  xdg.desktopEntries.swayimg = {
    name = "Swayimg";
    exec = "${pkgs.swayimg}/bin/swayimg";
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # swayimg
      "image/png" = "swayimg.desktop";
      "image/jpeg" = "swayimg.desktop";
      "image/jpg" = "swayimg.desktop";
      "image/gif" = "swayimg.desktop";
      "image/bmp" = "swayimg.desktop";
      "image/tiff" = "swayimg.desktop";
      "image/webp" = "swayimg.desktop";

      # firefox
      "text/html" = "firefox.desktop";
      "application/pdf" = "firefox.desktop";

      # foot
      "inode/directory" = "foot.desktop";

      # vscode
      "text/plain" = "code.desktop";
      "application/json" = "code.desktop";
      "application/yaml" = "code.desktop";
    };
  };
}
