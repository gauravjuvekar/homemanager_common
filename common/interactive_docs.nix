{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      imagemagick
      pandoc
      pdftk
      python3Packages.pdftotext
      qpdf
    ];
}
