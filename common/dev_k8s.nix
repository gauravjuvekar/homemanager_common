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

  home.shellAliases =
    {
      "k" = "kubectl";
    };
}
