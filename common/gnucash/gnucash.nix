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
          "general/auto-decimal-point" = true;
          "general/date-format" = 3; # ISO
          "general/show-account-color-tabs" = false;
        };
    };
}
