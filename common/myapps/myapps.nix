{ pkgs, ... }:
{
  home.packages =
    [
      (
        pkgs.writeShellApplication
          {
            name = "mv_versioned";
            text = (builtins.readFile ./mv_versioned);
          }
      )
    ];
}
