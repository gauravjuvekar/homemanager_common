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
          "$volChangeCmd" = "wpctl set-volume @DEFAULT_AUDIO_SINK@";
          "$volMuteCmd" = "wpctl set-mute @DEFAULT_AUDIO_SINK@";
          bind =
            [
              "$mod,  C,     killactive"
              "$mod,  F,     exec,           $fileManager"
              "$mod,  M,     exec,           $logout"
              "$mod,  Q,     killactive"
              "$mod,  R,     exec,           $menu"
              "$mod,  T,     exec,           $terminal"
              "$mod,  SPACE, togglefloating"
              ", XF86AudioRaiseVolume, exec, $volMuteCmd 0"
              ", XF86AudioMute,        exec, $volMuteCmd toggle"
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
          binde =
            [
              ", XF86AudioRaiseVolume, exec, $volChangeCmd 5%+"
              ", xF86AudioLowerVolume, exec, $volChangeCmd 5%-"
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

  systemd.user.services.shikane =
    {
      Unit =
        {
          Description = "Wayland display autorandr in hyprland session";
          After = [ "hyprland-session-pre.target" ];
          PartOf = [ "hyprland-session.target" ];
        };
      Service =
        {
          ExecStart = "${pkgs.shikane}/bin/shikane";
          Type = "exec";
        };
      Install =
        {
          WantedBy = [ "hyprland-session.target" ];
        };
    };
}

