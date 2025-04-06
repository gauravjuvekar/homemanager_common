{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      isort
      poetry
      python3Full
      uv
      yapf
    ];
}
