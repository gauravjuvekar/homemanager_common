{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      imagemagick
      pandoc
      pdftk
      poppler_utils # pdftotext
      qpdf
    ];
}
