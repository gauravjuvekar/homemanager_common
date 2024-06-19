{ pkgs, ... }:
{
  imports =
    [
      ./gnucash/gnucash.nix
      ./picard/picard.nix
    ];
  home.packages = with pkgs;
    [
      calibre
      clementine
      kid3-qt
      python312Packages.eyed3
    ];
}
