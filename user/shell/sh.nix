{config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "avit";
      plugins = [ "git" "fzf" ];
    };
    shellAliases = {
      "g" = "git";
   };
  };

  home.packages = with pkgs; [
    zsh
    fzf
    alacritty
  ];
}
