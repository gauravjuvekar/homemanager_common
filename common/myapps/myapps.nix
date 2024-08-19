{ pkgs, ... }:
{
  home.packages =
    [
      (
        pkgs.writeShellApplication
          {
            name = "g-bp";
            runtimeInputs =
              [
                pkgs.git
                pkgs.ripgrep
              ];
            text = (builtins.readFile ./g-bp);
          }
      )
      (
        pkgs.writeShellApplication
          {
            name = "g-clean-untracked";
            runtimeInputs =
              [
                pkgs.git
                pkgs.parallel
                pkgs.ripgrep
              ];
            text = (builtins.readFile ./g-clean-untracked);
          }
      )
      (
        pkgs.writeShellApplication
          {
            name = "mv_versioned";
            text = (builtins.readFile ./mv_versioned);
          }
      )
    ];
}
