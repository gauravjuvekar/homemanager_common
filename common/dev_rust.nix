{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      cargo
      # FTBFS
      # cargo-audit
      cargo-depgraph
      cargo-lock
      cargo-play
      cargo-sort
      cargo-vet
      cargo-watch
      clippy
      rust-analyzer
      rustc
      rustfmt
    ];

  xdg.configFile."rustfmt/rustfmt".text =
    ''
      max_width: 80
    '';
}
