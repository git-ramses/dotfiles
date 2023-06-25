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

  -- nerdtree
  use 'preservim/nerdtree'

  -- formatting
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'junegunn/vim-easy-align' -- what this do?
  use 'tpope/vim-endwise'
  use 'windwp/nvim-autopairs'

  -- git
  use 'tpope/vim-fugitive'

  -- harpoon
  use { 'ThePrimeagen/harpoon' }
  use { 'nvim-lua/plenary.nvim' }

  -- fzf
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  }

  -- themes
  use { "catppuccin/nvim", as = "catppuccin" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
