{ config, pkgs, ... }:
{
  imports =
    [
      ./dev_python.nix
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
      lua-language-server
      nixd
      nodePackages.bash-language-server
      nodePackages.nodejs
      nodePackages.vim-language-server
      nodePackages.vscode-json-languageserver
      patchutils
      perlnavigator
      sqlite
      tree-sitter
      ydiff
    ];
}
