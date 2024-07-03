{config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      bindkey -v
    '';
    oh-my-zsh = {
      enable = true;
      theme = "avit";
      plugins = [ "git" "fzf" ];
    };
    shellAliases = {
      "g" = "git";
      "hms" = "home-manager switch --flake ~/.config/nixos";
   };
  };

  home.file = {
    ".config/alacritty" = {
      source = ./alacritty;
      recursive = true;
    };

    ".config/tmux" = {
      source = ./tmux;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    zsh
    fzf
    alacritty
    tmux
  ];
}
