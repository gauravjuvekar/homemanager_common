{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      chromium
      firefox
      libreoffice
      mpv
      obs-studio
      openshot-qt
      thunderbird
      vlc
    ];
}
