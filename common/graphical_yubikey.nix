{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      yubikey-personalization-gui
      yubioath-flutter
    ];
}
