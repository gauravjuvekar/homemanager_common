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
                position = "350, 100";
              }
              {
                monitor = "";
                text = "${config.fullname} (${config.home.username})<br/>${config.fqdn}";
                text_align = "center";
                halign = "left";
                valign = "center";
                font_size = 50;
                position = "400, -100";
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
          "$modA" = "SUPER_ALT";
          "$modAS" = "SUPER_ALT_SHIFT";
          "$modC" = "SUPER_CTRL";
          "$modCS" = "SUPER_CTRL_SHIFT";
          "$fileManager" = "${pkgs.nemo}/bin/nemo";
          "$logout" = "${config.programs.wlogout.package}/bin/wlogout";
          "$menu" =  "${pkgs.fuzzel}/bin/fuzzel";
          "$screenshotTool" = "wayland-screenshot";
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
              "$modS, R,     exec,                   $screenshotTool"
              "$modS, S,     movetoworkspace,        special"
              ", XF86AudioMute,        exec,         $volMuteCmd toggle"
              ", XF86AudioRaiseVolume, exec,         $volMuteCmd 0"

              "$modCS, H,     movecurrentworkspacetomonitor,  l"
              "$modCS, left,  movecurrentworkspacetomonitor,  l"
              "$modCS, L,     movecurrentworkspacetomonitor,  r"
              "$modCS, right, movecurrentworkspacetomonitor,  r"

              "$modC,  J,     focusworkspaceoncurrentmonitor, m+1"
              "$modC,  down,  focusworkspaceoncurrentmonitor, m+1"
              "$modC,  K,     focusworkspaceoncurrentmonitor, m-1"
              "$modC,  up,    focusworkspaceoncurrentmonitor, m-1"

              "$modC,  L,     focusworkspaceoncurrentmonitor, r+1"
              "$modC,  right, focusworkspaceoncurrentmonitor, r+1"
              "$modC,  H,     focusworkspaceoncurrentmonitor, r-1"
              "$modC,  left,  focusworkspaceoncurrentmonitor, r-1"

              "$modAS, J,     movetoworkspace,                r+1"
              "$modAS, K,     movetoworkspace,                r-1"
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
          xwayland =
            {
              # Soft blur is better than pixelated
              use_nearest_neighbor = false;
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
                After = [ "wayland-session@Hyprland.target" ];
                PartOf = [ "wayland-session@Hyprland.target" ];
                BindsTo = [ "wayland-session@Hyprland.target" ];
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

  programs.waybar =
    {
      enable = true;
      systemd = { enable = true; };
      settings =
        {
          mainBar =
            {
              layer = "top";
              position = "top";
              height = 32;
              modules-left =
                [
                  "hyprland/workspaces"
                  "wlr/taskbar"
                ];
              modules-center =
                [
                  "hyprland/window"
                ];
              modules-right =
                [
                  "keyboard-state"
                  "hyprland/submap"
                  "bluetooth"
                  "pulseaudio"
                  "clock"
                  "idle_inhibitor"
                  "systemd-failed-units"
                ];

              "hyprland/workspaces" =
                {
                  disable-scroll = true;
                  all-outputs = false;
                  show-special = true;
                  special-visible-only = true;
                };

              "hyprland/window" =
                {
                  separate-outputs = true;
                };

              keyboard-state =
                {
                  numlock = true;
                  capslock = true;
                  scrolllock = true;
                };

              "wlr/taskbar" =
                {
                  on-click = "activate";
                  on-click-middle = "close";

                };


              idle_inhibitor =
                {
                  format = "{icon}";
                  format-icons =
                    {
                      activated = builtins.fromJSON '' "\uf0f4" ''; # icon-coffee
                      deactivated = builtins.fromJSON '' "\uf186" ''; # icon-moon

                    };
                };

              clock =
                {
                  interval = 1;
                  format = "{:%a %F %T%z %Z}";
                  tooltip-format =
                    "<tt>{tz_list}</tt>" +
                    "\n" +
                    "<tt>{calendar}</tt>";
                  timezones =
                    [
                      "America/Los_Angeles"
                      "Asia/Kolkata"
                      "America/New_York"
                      "Asia/Taipei"
                      "Etc/UTC"
                    ];
                  actions =
                    {
                      on-click-right = "mode";
                      on-scroll-up = "tz_up";
                      on-scroll-down = "tz_down";
                    };
                  calendar =
                    {
                      mode = "year";
                      mode-mon-col = 3;
                      week-pos = "left";
                      on-scroll = 1;
                    };
                };
            };
        };
      style = ./waybar.css;
    };
}

