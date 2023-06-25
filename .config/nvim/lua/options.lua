-- default config
local api = vim.api
local g = vim.g
local opt = vim.opt

-- remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true})
g.mapleader = " "
g.maplocalleader = " "

opt.termguicolors  = true -- enable colors in terminal
opt.hlsearch       = true -- set highlight on search
opt.number         = true -- enables line numbers
opt.relativenumber = true -- enables relative line numbers
opt.mouse          = "a" -- enables mouse mode
opt.breakindent    = true -- enables break indent
opt.undofile       = true -- save undo history
opt.ignorecase     = true -- case insensitive searching unless /C or capital in search
opt.smartcase      = true -- smart case
opt.updatetime     = 250 -- decreate update time
opt.signcolumn     = "yes" -- always show sign column
opt.clipboard      = "unnamedplus" -- access system clipboard
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

-- highlight on yank
vim.cmd[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

require('nvim-autopairs').setup{}
