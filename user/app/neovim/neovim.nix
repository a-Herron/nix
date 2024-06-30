{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
  ];

  home.file = {

  };
}
