{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      dfu-util
      keymapviz
      qmk
      via
      wally-cli
    ];
}
