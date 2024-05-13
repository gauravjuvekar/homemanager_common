{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      graphviz
      meld
      pandoc
      plantuml
      sqlitebrowser
    ];
}
