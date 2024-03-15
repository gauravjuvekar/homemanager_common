{ config, pkgs, ... }:
{
  programs.alacritty =
    {
      enable = true;
      settings =
        {
          scrolling =
            {
              history = 100000;
            };
          font =
            {
              normal =
                {
                  family = "Droid Sans Mono Dotted for Powerline";
                  style = "Regular";
                };
            };
        };
    };
}
