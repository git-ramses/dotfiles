-- plugin definition and loading

-- Boostrap Packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end

-- helper function to load in plugin-specific configuration defined in lua/plugins/
function get_setup(name)
  return string.format('require("plugins/%s")', name)
end

-- Load Packer
vim.cmd([[packadd packer.nvim]])

-- initialize plugins
return require('packer').startup(function(use)
  -- Let Packer manage itself
  use { 'wbthomason/packer.nvim', opt = true }

  -- tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- lsp
  use { 'neovim/nvim-lspconfig', config = get_setup("lsp") }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = get_setup("trouble"),
  }
  use { 'neoclide/coc.nvim', branch = 'release', config = get_setup("coc") }

  -- file tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = get_setup("nvimtree"),
  }

  -- utility
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'junegunn/vim-easy-align'
  use 'tpope/vim-endwise'
  use { 'windwp/nvim-autopairs', config = get_setup("nvim_autopairs") }
  use 'ntpeters/vim-better-whitespace'
  use { "folke/which-key.nvim", config = get_setup("whichkey") }
  use { 'AndrewRadev/splitjoin.vim' }

  -- git
  use { 'lewis6991/gitsigns.nvim', config = get_setup("gitsigns") }
  use { 'tpope/vim-fugitive' }
  use { 'APZelos/blamer.nvim' }

  -- harpoon
  use { 'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' }

  -- fzf
  use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf', run = ':call fzf#install()' } }

  -- themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'GustavoPrietoP/doom-themes.nvim' }
  use { 'xolox/vim-colorscheme-switcher' }
  use { 'xolox/vim-misc' } -- dependency for the above switcher

  -- syntax
  use { 'slim-template/vim-slim' }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = get_setup("lualine"),
  }

  -- rails/testing
  use { 'tpope/vim-rails' }
  use { "klen/nvim-test", config = get_setup("nvimtest") }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
