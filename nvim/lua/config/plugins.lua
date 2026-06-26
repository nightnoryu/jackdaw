local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd.packadd 'packer.nvim'
end

require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- Appearance
  use {
    'sainnhe/everforest',
    config = function()
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = false
      vim.g.everforest_background = 'hard'
      vim.cmd.colorscheme 'everforest'
    end,
  }
  use('nvim-tree/nvim-web-devicons')
  use('hoob3rt/lualine.nvim')

  -- File navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    },
  }
  use {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({ view_options = { show_hidden = true } })
      vim.keymap.set('n', '-', ':Oil<CR>')
    end
  }

  -- Editing
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({ ignore = '^$' })
    end,
  }
  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }

  -- Miscellaneous
  use('tpope/vim-fugitive')
  use {
    'nathom/filetype.nvim',
    setup = function()
      vim.g.did_load_filetypes = 1
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

if vim.fn.exists('g:loaded_matchit') == 0 then
  vim.cmd('runtime! macros/matchit.vim')
end
