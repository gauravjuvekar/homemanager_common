{ ... }:
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
                  family = "DroidSansMDotted Nerd Font";
                  style = "Regular";
                };
            };
        };
    };
}
