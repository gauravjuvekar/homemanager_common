{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      graphviz
      meld
      plantuml
      sqlitebrowser
    ];
}
