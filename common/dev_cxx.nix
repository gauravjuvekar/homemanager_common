{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      (hiPrio gcc)  # HOLY SHIT, Clang is broken GH 277564, 153759, 147342
      clang
      clang-tools
      llvmPackages.libcxxStdenv
      python311Packages.compiledb
    ];
}
