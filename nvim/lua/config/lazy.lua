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
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-lualine/lualine.nvim' },

    -- File navigation
    {
      'nvim-telescope/telescope.nvim', version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
    },
    {
      'stevearc/oil.nvim',
      opts = {
        view_options = {
          show_hidden = true,
        },
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        skip_confirm_for_simple_edits = true,
      },
    },

    -- Editing
    { 'numToStr/Comment.nvim', opts = { ignore = '^$' } },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },

    -- Git
    { 'tpope/vim-fugitive', cmd = 'G' },
    { 'lewis6991/gitsigns.nvim' },
  },
  checker = { enabled = false },
})
