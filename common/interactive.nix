{ pkgs, ... }:
{
  imports =
    [
      ./gpg/gpg.nix
      ./keyboards/keyboards_interactive.nix
      ./parallel/parallel.nix
      ./tmux/tmux.nix
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
      jqp
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
      unzip
      watchexec
      watchlog
      watchman
      yq
    ];
}
