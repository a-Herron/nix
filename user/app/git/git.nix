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
      pu = "pull";
      a = "add";
      aa = "add --all";
      d = "diff";
      l = "log --oneline";
      rh = "reset --hard HEAD";
      rs = "reset --soft";
      m = "merge master";
      mm = "merge main";
    };
    extraConfig = {
      init.defaultBranch = "main";
      push = { autoSetupRemote = true; };
    };
  };
}
