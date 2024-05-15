{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      imagemagick
      pandoc
      pdftk
      python312Packages.pdftotext
      qpdf
    ];
}
