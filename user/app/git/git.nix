{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "a-Herron";
    userEmail = "austinherronmt+git@gmail.com";
    aliases = {
      s = "status";
      c = "commit -m";
      ca = "commit -am";
      co = "checkout";
      p = "push";
      aa = "add --all";
    };
    extraConfig = {
      init.defaultBranch = "main";
      push = { autoSetupRemote = true; };
    };
  };
}
