{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      cantarell-fonts
      # corefonts
      dejavu_fonts
      gyre-fonts
      liberation_ttf
      libertine
      monaspace
      nerdfonts
      noto-fonts
      open-fonts
      powerline-fonts
      powerline-symbols
      proggyfonts
    ];
}
