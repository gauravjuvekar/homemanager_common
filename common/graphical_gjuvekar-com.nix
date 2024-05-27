{ pkgs, ... }:
{
  imports =
    [
      ./gnucash/gnucash.nix
    ];
  home.packages = with pkgs;
    [
      calibre
      clementine
      kid3-qt
      picard
      python312Packages.eyed3
    ];
}
