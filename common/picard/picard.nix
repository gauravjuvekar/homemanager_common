{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      picard
    ];
  xdg.configFile."MusicBrainz/Picard.ini".source = ./Picard.ini;
}
