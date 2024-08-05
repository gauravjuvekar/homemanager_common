{ pkgs, ... }:
{
  imports =
    [
      ./firefox/firefox.nix
    ];

  home.packages = with pkgs;
    [
      chromium
      libreoffice
      mpv
      obs-studio
      openshot-qt
      thunderbird
      vlc
    ];
}
