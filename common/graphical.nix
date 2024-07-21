{ pkgs, ... }:
{
  imports =
    [
      ./alacritty/alacritty.nix
      ./cinnamon/cinnamon.nix
      ./graphical_xdg.nix
      ./hyprland/hyprland.nix
      ./nemo/nemo.nix
    ];

  home.packages = with pkgs;
    [
      arandr
      baobab
      bless
      blueberry
      flameshot
      dconf-editor
      gnome-font-viewer
      gnome-system-monitor
      seahorse
      screenkey
      shutter
      wmctrl
      xclip
      xorg.xkill
    ];
}
