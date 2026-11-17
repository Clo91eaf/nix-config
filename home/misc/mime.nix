{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
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
      "application/x-pdf" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";

      # Luciole
      "inode/directory" = "dev.noctalia.luciole.desktop";

      # zed
      "text/plain" = "dev.zed.Zed.desktop";
      "application/json" = "dev.zed.Zed.desktop";
      "application/yaml" = "dev.zed.Zed.desktop";
    };
  };
}
