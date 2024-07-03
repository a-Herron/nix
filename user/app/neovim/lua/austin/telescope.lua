local builtin = require('telescope.builtin')
local telescope = require('telescope')
require('telescope').setup({
  extensions = {
      ["ui-select"] = {
        require('telescope.themes').get_dropdown()
      }
    }
})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")

vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<learder>sg', builtin.live_grep, {})

require'nvim-web-devicons'.setup {
}
