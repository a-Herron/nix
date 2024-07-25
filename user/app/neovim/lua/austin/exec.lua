vim.api.nvim_create_user_command('Curl', ':set splitright | vnew | set filetype=sh | read !sh #', {})

