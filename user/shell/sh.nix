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
      "opr" = "op run --no-masking --";
      "g" = "git";
      "hms" = "home-manager switch --flake ~/.config/nixos";
      "dn" = "dotnet";
      "dnwr" = "dn watch run --no-hot-reload";
   };

   sessionVariables = {
     GITHUB_TOKEN="op://Employee/ghpat/token";
     MK_TOKEN="op://Employee/media-kind/credential";
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
