{ pkgs, ... }:
{
  imports =
    [
      ./dev_python.nix
      ./neovim/neovim.nix
      ./shell.nix
    ];

  home.packages = with pkgs;
    [
      ansible
      ansible-lint
      bfg-repo-cleaner
      gdb
      gh
      git
      git-filter-repo
      git-repo
      glab
      patchutils
      sqlite
      ydiff
    ];
}
