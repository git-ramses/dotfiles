-- default config

local api = vim.api
local opt = vim.opt

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- remap leader and local leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = ","
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true})

opt.termguicolors  = true
opt.hlsearch       = true
opt.number         = true
opt.relativenumber = true
opt.mouse          = "a"
opt.breakindent    = true
opt.undofile       = true
opt.ignorecase     = true
opt.smartcase      = true
opt.updatetime     = 250
opt.signcolumn     = "yes"
opt.clipboard      = "unnamedplus"
opt.showtabline    = 2
opt.smarttab       = true
opt.smartindent    = true
opt.expandtab      = true
opt.tabstop        = 2
opt.softtabstop    = 2
opt.shiftwidth     = 2
opt.splitbelow     = true
opt.splitright     = true
opt.scrolloff      = 12
opt.sidescrolloff  = 8
opt.cmdheight      = 1
opt.pumheight      = 10
opt.showmode       = false
opt.title          = true
vim.cmd[[set autochdir]]

-- fzf layout
vim.cmd[[let g:fzf_layout = { 'down':  '30%'}]]
vim.cmd[[
let g:fzf_preview_window = []
]]

-- highlight on yank
vim.cmd[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
