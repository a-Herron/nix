local treesitter = require('nvim-treesitter.configs')
local telescope_builtin = require("telescope.builtin")
local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

  vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
  vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)

  vim.keymap.set("n", "<C-f>", function() vim.lsp.buf.format() end, opts)

  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

lsp.setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.yamlls.setup{}
lspconfig.fsautocomplete.setup{}
lspconfig.dockerls.setup{}
lspconfig.docker_compose_language_service.setup{}
lspconfig.jsonls.setup {
  capabilities = capabilities
}
lspconfig.csharp_ls.setup{}
lspconfig.hls.setup{}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}


treesitter.setup {
  auto_install = false,
  highlight = { enable = true },
}
