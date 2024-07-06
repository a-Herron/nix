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
      a = "add";
      aa = "add --all";
      d = "diff";
      l = "log --oneline";
    };
    extraConfig = {
      init.defaultBranch = "main";
      push = { autoSetupRemote = true; };
    };
  };
}
