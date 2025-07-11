{ pkgs, ... }:
{
  imports =
    [
      ./audio/audio_interactive.nix
      ./gpg/gpg.nix
      ./keyboards/keyboards_interactive.nix
      ./parallel/parallel.nix
      ./tmux/screen.nix
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
