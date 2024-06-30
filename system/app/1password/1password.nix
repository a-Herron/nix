{pkgs, ...}:

{
  users.users.austin.packages = with pkgs; [
    _1password
    _1password-gui
  ];

  programs._1password.enable = true;
  programs._1password-gui.enable = true;

}

