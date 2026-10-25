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

    {
      'nvim-lualine/lualine.nvim',
      opts = {
        options = {
          icons_enabled = true,
          theme = 'everforest',
          component_separators = { left = '|', right = '|' },
          section_separators = {},
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode', function() if vim.o.iminsert == 1 then return 'RU' else return '' end end },
          lualine_b = { 'FugitiveHead' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype', function() return string.format('%s[%s]', vim.bo.fileencoding, vim.bo.fileformat) end },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        extensions = { 'quickfix', 'fugitive' },
      },
    },

    { 'nvim-tree/nvim-web-devicons' },

    -- File navigation
    {
      'nvim-telescope/telescope.nvim', version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
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
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
            },
          },
        })
      end,
    },

    {
      'stevearc/oil.nvim',
      opts = {
        view_options = {
          show_hidden = true,
        },
        columns = {
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
    { 'windwp/nvim-autopairs', opts = {} },

    -- Git
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
  },
  checker = { enabled = false },
})
