{ pkgs, ... }:
{
  imports =
    [
      ./firefox/firefox.nix
    ];

  home.packages = with pkgs;
    [
      chromium
      digikam
      libreoffice
      mpv
      obs-studio
      openshot-qt
      qalculate-gtk
      remmina
      thunderbird
      vlc
    ];
}
