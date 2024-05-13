{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      yubikey-manager-qt
      yubikey-personalization-gui
    ];
}
