{pkgs, ... }:


{
  home.file = {
    ".config/i3/config".source = ./i3config/config;
    ".config/i3status/config".source = ./i3config/i3status.conf;
  };
}
