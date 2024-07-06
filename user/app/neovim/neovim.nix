{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xclip
    ripgrep
    dotnetCorePackages.sdk_8_0_2xx
    nodejs_20

    lua-language-server
    csharp-ls
    omnisharp-roslyn
    dockerfile-language-server-nodejs
    fsautocomplete
    vscode-langservers-extracted
    docker-compose-language-service
    yaml-language-server
    haskell-language-server
    ghc
    cabal-install
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs; [
      vimPlugins.telescope-nvim
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.telescope-ui-select-nvim
      vimPlugins.zen-mode-nvim

      vimPlugins.nvim-treesitter.withAllGrammars

      vimPlugins.lsp-zero-nvim
      vimPlugins.nvim-lspconfig
      vimPlugins.nvim-cmp
      vimPlugins.cmp-buffer
      vimPlugins.cmp-path
      vimPlugins.cmp-nvim-lsp
      vimPlugins.cmp-nvim-lua
      vimPlugins.cmp-nvim-lsp-signature-help
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
    "omnisharp" = {
      source = pkgs.omnisharp-roslyn;
      recursive = true;
    };
  };
}
