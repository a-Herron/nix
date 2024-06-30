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
  };

  home.packages = with pkgs; [
    zsh
    fzf
    alacritty
  ];
}
