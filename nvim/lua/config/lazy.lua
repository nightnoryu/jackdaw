local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Appearance
    {
      'sainnhe/everforest',
      priority = 1000,
      config = function()
        vim.g.everforest_transparent_background = 2
        vim.g.everforest_better_performance = 1
        vim.g.everforest_enable_italic = false
        vim.g.everforest_background = 'hard'
        vim.cmd.colorscheme 'everforest'
      end,
    },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'nvim-lualine/lualine.nvim' },

    -- File navigation
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
    },
    {
      'stevearc/oil.nvim',
      config = function()
        require('oil').setup({ view_options = { show_hidden = true } })
        vim.keymap.set('n', '-', ':Oil<CR>')
      end
    },

    -- Editing
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({ ignore = '^$' })
      end,
    },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup()
      end,
    },

    -- Git
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },

    -- import your plugins
    -- { import = "plugins" },
  },
  checker = { enabled = false },
})
