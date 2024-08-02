{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      xreader
      pdfarranger
    ];
}
