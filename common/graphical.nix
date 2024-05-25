{ config, pkgs, ... }:
{
  imports =
    [
      ./alacritty/alacritty.nix
      ./cinnamon/cinnamon.nix
      ./nemo/nemo.nix
    ];

  home.packages = with pkgs;
    [
      arandr
      baobab
      bless
      blueberry
      flameshot
      gnome.dconf-editor
      gnome.gnome-font-viewer
      gnome.gnome-system-monitor
      gnome.seahorse
      screenkey
      shutter
      wmctrl
      xclip
      xorg.xkill
    ];
}
