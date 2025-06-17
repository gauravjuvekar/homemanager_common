{ pkgs, ... }:
let
  wayland_gui_allow_root = pkgs.writeShellScriptBin "wayland-gui-allow-root"
    ''
      ${pkgs.xorg.xhost}/bin/xhost si:localuser:root
    '';
  wayland_gui_forbid_root = pkgs.writeShellScriptBin "wayland-gui-forbid-root"
    ''
      ${pkgs.xorg.xhost}/bin/xhost -si:localuser:root
    '';
  wayland_screenshot = pkgs.writeShellScriptBin "wayland-screenshot"
    ''
      ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)" - | ${pkgs.swappy}/bin/swappy -f -
    '';

  mySommelier = pkgs.sommelier.overrideDerivation (oldAttrs:
    {
      # Bug https://github.com/NixOS/nixpkgs/issues/332332
      doCheck = false;
    });
in
{
  imports =
    [
      ./waybar/waybar.nix
    ];

  home.packages =
    (
      with pkgs; [
        shikane
        wdisplays
        wev
        wl-clipboard
      ]
    ) ++
    [
      mySommelier
      wayland_gui_allow_root
      wayland_gui_forbid_root
      wayland_screenshot
    ];
  xdg.configFile."uwsm/env".text =
    ''
      export NIXOS_OZONE_WL=1
    '';

  systemd.user.services =
    let
      startupService =
        (
          {desc, cmd}:
          {
            Unit =
              {
                Description = desc;
                After = [ "graphical-session.target" ];
                PartOf = [ "graphical-session.target" ];
                BindsTo = [ "graphical-session.target" ];
              };
            Service =
              {
                ExecStart = cmd;
                Type = "exec";
              };
            Install =
              {
                WantedBy = [ "graphical-session.target" ];
              };
            }
        );
    in
    {
      shikane =
        startupService {
          desc="Wayland display autorandr";
          cmd="${pkgs.shikane}/bin/shikane";
        };
      swaync =
        startupService {
          desc="Sway notification center";
          cmd="${pkgs.swaynotificationcenter}/bin/swaync";
        };
    };
}
