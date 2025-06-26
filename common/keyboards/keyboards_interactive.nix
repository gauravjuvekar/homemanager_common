{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      dfu-util
      keymapviz
      qmk
      # via # suddenly shows as unfree
      wally-cli
    ];
}
