{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      dive
      helm
      kubectl
      kubectl-validate
      podman-tui
      skopeo
    ];
}
