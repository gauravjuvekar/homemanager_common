{  pkgs, ... }:
{
  imports =
    [
      ./gpg/gpg.nix
    ];
  home.packages = with pkgs;
    [
      (hiPrio parallel) # Because moreutils overwrites it
      age
      atop
      bat
      dig
      du-dust
      fclones
      file
      htop
      inetutils
      inotify-tools
      iotop
      jq
      libsecret
      moreutils
      openssl
      pigz
      psmisc
      rage
      rsync
      screen
      sshfs
      sshpass
      step-cli
      tmux
      unzip
      watchexec
      yq
    ];
}
