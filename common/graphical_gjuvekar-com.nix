{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      calibre
      clementine
      gnucash
      kid3-qt
      picard
      python312Packages.eyed3
      syncthing
    ];
}
