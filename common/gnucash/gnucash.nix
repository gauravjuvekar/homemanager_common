{ config, pkgs, ... }:
{
  home.packages = with pkgs;
    [
      bindfs
      gnucash
    ];

  systemd.user.mounts =
    {
      "home-${config.home.username}-mnt-gnucash_readonly" =
        {
          Unit =
            {
              Description = "Read only mount of gnucash for libreoffice base odbc connector";
            };
          Mount =
            {
              What = "%h/Documents/finances/gnucash";
              Where = "/home/${config.home.username}/mnt/gnucash_readonly";
              Type = "fuse.bindfs";
              Options = "ro,x-gvfs-hide";
            };
          Install =
            {
              WantedBy = [ "default.target" ];
            };
        };
    };

  dconf.settings =
    {
      "org/gnucash/GnuCash" =
        {
          "general/auto-decimal-point" = false;
          "general/date-format" = 3; # ISO
          "general/show-account-color-tabs" = false;
        };
    };
}
