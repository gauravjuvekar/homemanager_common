{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      shikane
      wdisplays
    ];
}

