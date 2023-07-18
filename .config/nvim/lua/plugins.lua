-- plugin definition and loading
-- local execute = vim.api.nvim_command

local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end

-- Load Packer
cmd([[packadd packer.nvim]])

-- initialize plugins
return require('packer').startup(function(use)
  -- Let Packer manage itself
  use({'wbthomason/packer.nvim', opt = true})

  -- tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- lsp
  use { 'neovim/nvim-lspconfig' }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- file tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- utility
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'junegunn/vim-easy-align'
  use 'tpope/vim-endwise'
  use 'windwp/nvim-autopairs'
  use 'ntpeters/vim-better-whitespace'
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  }
  use { 'AndrewRadev/splitjoin.vim' }

  -- git
  use { 'lewis6991/gitsigns.nvim' }
  use { 'tpope/vim-fugitive' }
  use { 'APZelos/blamer.nvim' }

  -- harpoon
  use { 'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' }

  -- fzf
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  }

  -- themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'GustavoPrietoP/doom-themes.nvim' }
  use { 'xolox/vim-colorscheme-switcher' }
  use { 'xolox/vim-misc' } -- dependency for the above switcher

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- tests
  use {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
