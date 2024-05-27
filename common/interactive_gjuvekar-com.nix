{ config, pkgs, ... }:
{
  imports =
    [
      ./syncthing/syncthing.nix
    ];
}
