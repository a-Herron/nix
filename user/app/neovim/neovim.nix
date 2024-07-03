{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xclip
    ripgrep
    dotnetCorePackages.sdk_8_0_2xx
    lua-language-server
    csharp-ls
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs; [
      vimPlugins.telescope-nvim
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.telescope-ui-select-nvim

      vimPlugins.nvim-treesitter.withAllGrammars

      vimPlugins.lsp-zero-nvim
      vimPlugins.nvim-lspconfig
      vimPlugins.nvim-cmp
      vimPlugins.cmp-buffer
      vimPlugins.cmp-path
      vimPlugins.cmp-nvim-lsp
      vimPlugins.cmp-nvim-lua
      vimPlugins.luasnip
      vimPlugins.cmp_luasnip

      vimPlugins.plenary-nvim

      vimPlugins.harpoon2

      vimPlugins.vim-sleuth
      vimPlugins.nvim-web-devicons
      vimPlugins.catppuccin-nvim
    ];
  };

  home.file = {
    ".config/nvim/init.lua" = {
      source = ./init.lua;
    };
    ".config/nvim/lua" = {
      source = ./lua;
      recursive = true;
    };
  };
}
