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

      # # firefox
      # "text/html" = "firefox.desktop";
      # "application/pdf" = "firefox.desktop";

      # google-chrome
      # "text/html" = "google-chrome.desktop";
      # "application/pdf" = "google-chrome.desktop";
      # "x-scheme-handler/http" = "google-chrome.desktop";
      # "x-scheme-handler/https" = "google-chrome.desktop";
      # "x-scheme-handler/about" = "google-chrome.desktop";
      # "x-scheme-handler/unknown" = "google-chrome.desktop";

      # zen
      "text/html" = "zen.desktop";
      "application/pdf" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";

      # kitty
      "inode/directory" = "kitty.desktop";

      # zed
      "text/plain" = "dev.zed.Zed.desktop";
      "application/json" = "dev.zed.Zed.desktop";
      "application/yaml" = "dev.zed.Zed.desktop";
    };
  };
}
