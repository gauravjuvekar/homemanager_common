{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      yubikey-manager
    ];
  programs.gpg =
    {
      scdaemonSettings =
        {
          disable-ccid = true;
          reader-port = "Yubico Yubi";
        };
    };
}
