{pkgs, ... }:


{
  home.file = {
    ".config/i3/config".source = ./i3config/config;
  };
}
