{ config, pkgs, ... }:
{
  imports =
    [
      ../wayland/wayland.nix
    ];

  programs.hyprlock =
    {
      enable = true;
      settings =
        {
          general =
            {
              no_fade_in = true;
              no_fade_out = true;
            };
          background =
            [
              {
                path = "";
                blur_passes = 3;
                blur_size = 8;
              }
            ];
          input-field =
            [
              {
                monitor = "";
                fade_on_empty = false;
                fail_text = "($ATTEMPTS) | $FAIL";
                placeholder_text = "$PROMPT ";
                size = "500, 50";
              }
            ];
          label =
            [
              {
                monitor = "";
                text = "cmd[update:1000] date --rfc-3339 seconds";
                text_align = "center";
                font_size = 50;
                halign = "left";
                valign = "center";
              }
              {
                monitor = "";
                text = "${config.fullname} (${config.home.username})<br/>${config.fqdn}";
                text_align = "center";
                halign = "left";
                valign = "center";
                font_size = 50;
                position = "400, -50";
              }
            ];
        };
    };

  programs.wlogout =
    {
      enable = true;
      layout =
        [
          {
            "label" = "lock";
            "action" = "${config.programs.hyprlock.package}/bin/hyprlock";
            "text" = "Lock (l)";
            "keybind" = "l";
          }
          {
            "label" = "hibernate";
            "action" = "systemctl hibernate";
            "text" = "Hibernate (h)";
            "keybind" = "h";
          }
          {
            "label" = "logout";
            "action" = "${config.wayland.windowManager.hyprland.finalPackage}/bin/hyprctl dispatch exit";
            "text" = "Logout (e)";
            "keybind" = "e";
          }
          {
            "label" = "shutdown";
            "action" = "systemctl poweroff";
            "text" = "Shutdown (s)";
            "keybind" = "s";
          }
          {
            "label" = "suspend";
            "action" = "systemctl suspend";
            "text" = "Suspend (u)";
            "keybind" = "u";
          }
          {
            "label" = "reboot";
            "action" = "systemctl reboot";
            "text" = "Reboot (r)";
            "keybind" = "r";
          }
        ];
    };

  wayland.windowManager.hyprland =
    {
      enable = true;
      settings =
        {
          "$mod" = "SUPER";
          "$modS" = "SUPER_SHIFT";
          "$fileManager" = "${pkgs.nemo}/bin/nemo";
          "$logout" = "${config.programs.wlogout.package}/bin/wlogout";
          "$menu" =  "${pkgs.fuzzel}/bin/fuzzel";
          "$terminal" = "${pkgs.alacritty}/bin/alacritty";
          "$volChangeCmd" = "wpctl set-volume @DEFAULT_AUDIO_SINK@";
          "$volMuteCmd" = "wpctl set-mute @DEFAULT_AUDIO_SINK@";
          animation =
            [
              "global, 1, 2, default"
            ];
          bind =
            [
              "$mod,  C,     killactive"
              "$mod,  F,     exec,                   $fileManager"
              "$mod,  G,     togglegroup"
              "$mod,  M,     exec,                   $logout"
              "$mod,  N,     changegroupactive,      f"
              "$mod,  P,     changegroupactive,      b"
              "$mod,  Q,     killactive"
              "$mod,  R,     exec,                   $menu"
              "$mod,  S,     togglespecialworkspace"
              "$mod,  SPACE, togglefloating"
              "$mod,  T,     exec,                   $terminal"
              "$modS, N,     movegroupwindow,        f"
              "$modS, P,     movegroupwindow,        b"
              "$modS, S,     movetoworkspace,        special"
              ", XF86AudioMute,        exec,         $volMuteCmd toggle"
              ", XF86AudioRaiseVolume, exec,         $volMuteCmd 0"
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
                    {mod="$modS"; action="movewindoworgroup";}
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
          misc =
            {
              force_default_wallpaper = 0;
            };
        };
      systemd.enable = false;
      xwayland.enable = true;
    };

    systemd.user.services =
      let
        startupService =
          (
            {desc, cmd}:
            {
              Unit =
                {
                  Description = desc;
                  After = [ "wayland-session-pre@Hyprland.target" ];
                  PartOf = [ "wayland-session@Hyprland.target" ];
                };
              Service =
                {
                  ExecStart = cmd;
                  Type = "exec";
                };
              Install =
                {
                  WantedBy = [ "wayland-session@Hyprland.target" ];
                };
              }
          );
      in
      {
        shikane =
          startupService {
            desc="Wayland display autorandr in hyprland session";
            cmd="${pkgs.shikane}/bin/shikane";
          };
        swaync =
          startupService {
            desc="Sway notification center in hyprland session";
            cmd="${pkgs.swaynotificationcenter}/bin/swaync";
          };
      };
}

