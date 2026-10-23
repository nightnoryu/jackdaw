local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-s>'] = actions.select_horizontal,
        ['<esc>'] = actions.close,
      },
    },
  },
})

vim.keymap.set('n', '<C-p>', builtin.git_files)
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols)
