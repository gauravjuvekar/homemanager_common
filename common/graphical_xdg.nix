{ config, pkgs, ... }:
{
  xdg.mime.enable = true;
  xdg.mimeApps =
    {
      enable = true;
      defaultApplications =
        {
          "applicaiton/x-extension-htm" = "firefox.desktop";
          "applicaiton/x-extension-html" = "firefox.desktop";
          "applicaiton/x-extension-shtml" = "firefox.desktop";
          "applicaiton/x-extension-xht" = "firefox.desktop";
          "applicaiton/x-extension-xhtml" = "firefox.desktop";
          "applicaiton/xhtml+xml" = "firefox.desktop";
          "application/pdf" = "xreader.desktop";
          "image/jpeg" = "xviewer.desktop";
          "image/png" = "xviewer.desktop";
          "image/svg+xml" = "xviewer.desktop";
          "inode/directory" = "nemo.desktop";
          "text/html" = "firefox.desktop";
          "text/plain" = "nvim.desktop";
          "text/x-vcalendar" = "thunderbird.desktop";
          "x-scheme-handler/chrome" = "firefox.desktop";
          "x-scheme-handler/ftp" = "firefox.desktop";
          "x-scheme-handler/http" = "firefox.desktop";
          "x-scheme-handler/https" = "firefox.desktop";
          "x-scheme-handler/mailto" = "thunderbird.desktop";
        };
    };
  xdg.userDirs.createDirectories = false;
}
