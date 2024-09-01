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
in
{
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
      wayland_gui_allow_root
      wayland_gui_forbid_root
    ];
}

