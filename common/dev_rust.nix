{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      cargo
      rust-analyzer
      rustc
      rustfmt
    ];

  xdg.configFile."rustfmt/rustfmt".text =
    ''
      max_width: 80
    '';
}
