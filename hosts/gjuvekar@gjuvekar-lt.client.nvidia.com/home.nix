{ config, pkgs, ... }:
{
  imports =
    [
      ../../common/base.nix
      ../../common/dev_lite.nix
      ../../common/graphical.nix
      ../../common/interactive.nix
    ];
}
