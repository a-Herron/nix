{ config, pkgs, ... }:

{
  home.packages = [pkgs.git];

  programs.git = {
    enable = true;
    userName = "a-Herron";
    userEmail = "austinherronmt+git@gmail.com";
    aliases = {
      s = "status";
      cm = "commit -m";
      ca = "commit -am";
      co = "checkout";
      pu = "push";
      aa = "add --all";
    };
    extraConfig = {
      init.defaultBranch = "main";
      push = { autoSetupRemote = true; };
    };
  };
}
