{ pkgs, ... }:
{
  programs.neovim =
    {
      enable = true;
      defaultEditor = true;
      extraConfig =
        ''
          set runtimepath^=~/.vim runtimepath+=~/.vim/after
          let &packpath = &runtimepath
          source ~/.vim/vimrc
        '';
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  home.packages = with pkgs;
    [
      lua-language-server
      nixd
      nodePackages.bash-language-server
      nodePackages.nodejs
      nodePackages.vim-language-server
      nodePackages.vscode-json-languageserver
      perlnavigator
      pyright
      tree-sitter
      yaml-language-server
    ];
}
