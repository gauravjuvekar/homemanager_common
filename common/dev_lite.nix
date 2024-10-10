{ pkgs, ... }:
let
  myYdiffOverlay = final: prev:
    {
      ydiff = prev.ydiff.overrideAttrs
        (
          old:
            {
              src = prev.fetchFromGitHub
                {
                  owner = "gauravjuvekar";
                  repo = "ydiff";
                  rev = "c68e7d7259bb3df332ca0d98c8bec75729a98457";
                  hash = "sha256-NKMuuKPY/FEOszeJZ0P0xyO/oTxbVvJD+AFfnit5zLM=";
                };
                doInstallCheck = false;
            }
        );
    };
  myPkgs = (pkgs.extend myYdiffOverlay);
in
{
  imports =
    [
      ./dev_python.nix
      ./git.nix
      ./neovim/neovim.nix
      ./shell.nix
    ];


  home.packages = with myPkgs;
    [
      ansible
      ansible-lint
      bfg-repo-cleaner
      gdb
      gh
      git
      git-filter-repo
      git-repo
      glab
      jsonschema
      patchutils
      repgrep
      sqlite
      ydiff
    ];
}
