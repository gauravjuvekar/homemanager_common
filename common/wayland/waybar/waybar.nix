{ ... }:
{
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
                  "niri/workspaces"
                  "wlr/taskbar"
                ];
              modules-center =
                [
                  "hyprland/window"
                  "niri/window"
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

              "niri/workspaces" =
                {
                  all-outputs = false;
                };

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

              "niri/window" =
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
