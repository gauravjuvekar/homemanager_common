{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      wdisplays
    ];
}

