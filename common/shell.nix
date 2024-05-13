{ config, pkgs, ... }:
{
  programs.bash.enable = true;
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
