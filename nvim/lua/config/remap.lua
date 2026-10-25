local telescope = require('telescope')
local builtin = require('telescope.builtin')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')

vim.keymap.set('c', '<C-A>', '<Home>')

vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize -2<CR>', opts)

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'J', 'v:count ? \'J\' : \'mzJ`z\'', { expr = true })

vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')

vim.keymap.set('i', '<C-j>', '<C-^>')

vim.cmd [[
function! Sort(type, ...)
  '[,']sort
endfunction
nnoremap <silent> gs :set opfunc=Sort<CR>g@
]]

telescope.load_extension('fzf')
vim.keymap.set('n', '<C-p>', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols)

vim.keymap.set('n', '-', ':Oil<CR>')

vim.keymap.set('n', '<leader>gs', ':Git<CR>')
