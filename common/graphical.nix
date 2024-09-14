{ pkgs, ... }:
{
  imports =
    [
      ./alacritty/alacritty.nix
      ./cinnamon/cinnamon.nix
      ./graphical_xdg.nix
      ./hyprland/hyprland.nix
      ./keyboards/keyboards_graphical.nix
      ./nemo/nemo.nix
    ];

  home.packages = with pkgs;
    [
      arandr
      baobab
      bless
      blueberry
      dconf-editor
      (flameshot.overrideAttrs {enableWlrSupport = true;})
      gnome-font-viewer
      gnome-system-monitor
      screenkey
      seahorse
      shutter
      wmctrl
      xclip
      xorg.xkill
    ];
}
