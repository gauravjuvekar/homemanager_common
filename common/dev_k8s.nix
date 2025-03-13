{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      dive
      helm
      kubectl
      kubectl-validate
      kubectx
      podman
      podman-tui
      skopeo
    ];

  home.shellAliases =
    {
      "k" = "kubectl";
    };
}
