{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      bindfs
      gnucash
    ];
}
