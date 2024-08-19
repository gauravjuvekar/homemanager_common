{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      cargo
      # FTBFS nixpkgs#335192
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
