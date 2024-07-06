{pkgs, ...}:

{
  users.users.austin.packages = with pkgs; [
    waybar
    dunst
    libnotify
    rofi-wayland
  ];
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware.opengl.enable = true;
}

