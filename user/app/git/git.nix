{ config, pkgs, ... }:

{
  home.packages = [pkgs.git];

  programs.git = {
    enable = true;
    userName = "a-Herron";
    userEmail = "austinherronmt+git@gmail.com";
    aliases = {
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
