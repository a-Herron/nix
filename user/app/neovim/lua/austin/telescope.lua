local builtin = require('telescope.builtin')
local telescope = require('telescope')
require('telescope').setup({
  extensions = {
      fzf = {
        fuzzy = true,
        case_mode = "smart_case",
      },
      ["ui-select"] = {
        require('telescope.themes').get_dropdown()
      }
    }
})

require('telescope').load_extension('fzf')
require('telescope').load_extension("ui-select")

vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})

require'nvim-web-devicons'.setup {
}
