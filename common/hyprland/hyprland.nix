{ pkgs, ... }:
{
  imports =
    [
      ../wayland/wayland.nix
    ];

  wayland.windowManager.hyprland =
    {
      enable = true;
      settings =
        {
          "$mod" = "SUPER";
          "$modS" = "SUPER_SHIFT";
          "$fileManager" = "${pkgs.cinnamon.nemo}/bin/nemo";
          "$logout" = "${pkgs.wlogout}/bin/wlogout";
          "$menu" =  "${pkgs.fuzzel}/bin/fuzzel";
          "$terminal" = "${pkgs.alacritty}/bin/alacritty";
          bind =
            [
              "$mod,  C,     killactive"
              "$mod,  F,     exec,           $fileManager"
              "$mod,  M,     exec,           $logout"
              "$mod,  Q,     killactive"
              "$mod,  R,     exec,           $menu"
              "$mod,  T,     exec,           $terminal"
              "$mod,  SPACE, togglefloating"
            ] ++
            (
              builtins.concatLists (
                  map (
                    {mod, action}:
                    [
                      "${mod}, left,  ${action}, l"
                      "${mod}, H,     ${action}, l"
                      "${mod}, down,  ${action}, d"
                      "${mod}, J,     ${action}, d"
                      "${mod}, up,    ${action}, u"
                      "${mod}, K,     ${action}, u"
                      "${mod}, right, ${action}, r"
                      "${mod}, L,     ${action}, r"
                    ]
                  ) [
                    {mod="$mod";  action="movefocus";}
                    {mod="$modS"; action="movewindow";}
                  ]
                )
            );
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

