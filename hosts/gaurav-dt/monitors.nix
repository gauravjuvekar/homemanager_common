{ ... }:
{
  xdg.configFile."shikane/config.toml".text =
    ''
[[profile]]
name = "dt_0111"

[[profile.output]]
search = ["s=305NTUWD2790"]
enable = true
mode = "3840x2160@60.00Hz"
position = "6144,0"
scale = 1.25

[[profile.output]]
search = ["s=306NTHM4F513"]
enable = true
mode = "3840x2160@60.00Hz"
position = "0,0"
scale = 1.25

[[profile.output]]
search = ["s=22231B003449"]
enable = true
mode = "3840x2160@144.00Hz"
position = "3072,0"
scale = 1.25
    '';
}
