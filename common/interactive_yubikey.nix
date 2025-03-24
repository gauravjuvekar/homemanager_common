{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      age-plugin-yubikey
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
