{ ... }:
{
  fullname = "Gaurav Juvekar";
  programs.git.extraConfig.user.email = "gauravjuvekar@gmail.com";
  home.username = "gaurav";
  home.homeDirectory = "/home/gaurav";

  programs.firefox.profiles."Personal" =
    {
      isDefault = true;
      settings."network.trr.mode" = 3;
    };
}
