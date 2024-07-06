{pkgs, ... }:

{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.variables = ["--all"];

  home.file = {
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
  };
}
