{ config, pkgs, ... }:
{
  imports =
    [
      ./dev_cxx.nix
      ./dev_lite.nix
      ./dev_rust.nix
    ];

  home.packages = with pkgs;
    [
      gnumake
    ];
}
