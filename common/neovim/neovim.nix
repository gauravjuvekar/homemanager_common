{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      lua-language-server
      neovim
      nixd
      nodePackages.bash-language-server
      nodePackages.nodejs
      nodePackages.vim-language-server
      nodePackages.vscode-json-languageserver
      perlnavigator
      tree-sitter
    ];

  home.sessionVariables =
    {
      EDITOR = "nvim";
    };

  xdg.configFile."nvim/init.vim".text =
    ''
      set runtimepath^=~/.vim runtimepath+=~/.vim/after
      let &packpath = &runtimepath
      source ~/.vim/vimrc
    '';
}
