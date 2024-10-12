{ ... }:
{
  programs.tmux =
    {
      enable = true;
      clock24 = true;
      extraConfig =
        ''
          bind-key -T copy-mode-vi 'v' send -X begin-selection
          bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
        '';
      historyLimit = 10000;
      keyMode = "vi";
      mouse = true;
    };
}
