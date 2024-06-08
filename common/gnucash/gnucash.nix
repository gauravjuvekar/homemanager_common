{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      bindfs
      gnucash
    ];

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
