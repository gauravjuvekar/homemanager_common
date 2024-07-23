{ pkgs, ... }:
{
  wayland.windowManager.hyprland =
    {
      enable = true;
      settings =
        {
          "$mod" = "SUPER";
          "$fileManager" = "${pkgs.cinnamon.nemo}/bin/nemo";
          "$menu" =  "${pkgs.wofi}/bin/wofi --show drun";
          "$terminal" = "${pkgs.alacritty}/bin/alacritty";
          bind =
            [
              "$mod, C, exec, killactive"
              "$mod, F, exec, $fileManager"
              "$mod, M, exec, exit"
              "$mod, R, exec, $menu"
              "$mod, T, exec, $terminal"
              "$mod, left,  movefocus, l"
              "$mod, down,  movefocus, d"
              "$mod, up,    movefocus, u"
              "$mod, right, movefocus, r"
              "$mod, H,     movefocus, l"
              "$mod, J,     movefocus, d"
              "$mod, K,     movefocus, u"
              "$mod, L,     movefocus, r"
              "$mod, SPACE, togglefloating"
            ];
          bindm =
            [
              "$mod, mouse:272, movewindow"
              "$mod, mouse:273, resizewindow"
            ];
          general =
            {
              border_size = 1;
              gaps_in = 0;
              gaps_out = 0;
              resize_on_border = true;
            };
          input =
            {
              kb_options = "caps:swapescape";
            };
          misc =
            {
              force_default_wallpaper = 0;
            };
        };
      xwayland.enable = true;
    };
}

