{ ... }:
{
  imports =
    [
      ./myapps/myapps.nix
    ];

  programs.bash.enable = true;

  home.shellAliases =
    {
      "a" = "git add";
      "b" = "git branch";
      "c" = "git commit";
      "ck" = "git checkout";
      "d" = "git diff";
      "da" = "git diff --cached";
      "dm" = "d $(gmb)";
      "dy" = "ydiff -H change -H whole-line -s -w0 --wrap --";
      "fetch" = "git fetch";
      "g" = "git";
      "gmb" = "git merge-base master HEAD";
      "gvm" = "git mergetool --tool='nvim -d' --prompt";
      "log" = "git log";
      "logg" = "git log --oneline --graph --decorate=full";
      "pull" = "git pull";
      "push" = "git push";
      "rc" = "git rebase --continue";
      "s" = "git status";
      # GFP
      "db" = "d $(gfp)";

      "e" = "nvim";
      "v" = "nvim -R";
      "vi" = "nvim";

      "f" = "fzf";
      "fn" = "find . -name";

      "ac" = "ag --cc";
      "ah" = "ag --hh";
      "rgc" = "rg --color=always";

      "LS" = "ls";
      "SL" = "ls";
      "sl" = "ls";

      "p" = "python";
      "pdb" = "python -m pdb -c continue";

      "clip" = "xclip -sel clip";
      "m" = "make";
      "o" = "xdg-open";
    };

  programs.zoxide =
    {
      enable = true;
      enableBashIntegration = true;
      options = [ "--cmd" "j" ];
    };
  programs.dircolors.enable = true;
  programs.direnv =
    {
      enable = true;
      enableBashIntegration = true;
    };
  programs.fzf.enable = true;
}
