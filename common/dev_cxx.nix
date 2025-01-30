{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      (hiPrio gcc)  # HOLY SHIT, Clang is broken GH 277564, 153759, 147342
      clang
      clang-tools
      compiledb
      llvmPackages.bintools-unwrapped
      llvmPackages.libcxxStdenv
    ];
}
