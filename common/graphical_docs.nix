{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      cinnamon.xreader
      pdfarranger
    ];
}
