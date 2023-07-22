-- general keymaps that are not plugin dependent

-- functional wrapper for mapping custom keybinds
-- mode: vim mode (normal/insert expressed as 'n'/'i', etc)
-- lhs:  custom keybind
-- rhs:  commands to execute
-- opts: additional args (ie silence/noremap)
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- basic navigation
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-l>', '<C-w>l', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<leader>q', ':q<CR>', {})

-- harpoon
map('n', '<Space>ha', ':lua require("harpoon.mark").add_file()<CR>', {})
map('n', '<Space>ht', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
map('n', '<Space>hn', ':lua require("harpoon.ui").nav_next()<CR>', {})
map('n', '<Space>hp', ':lua require("harpoon.ui").nav_prev()<CR>', {})

-- buffer
map('n', '<leader>bb', ':Buffers<CR>', {})
map('n', '<leader>bn', ':bnext<CR>', {})
map('n', '<leader>bp', ':bprevious<CR>', {})
map('n', '<leader>bd', ':bdelete<CR>', {})

-- file
map('n', '<leader>ff', ':Files<CR>', {})
map('n', '<leader>fs', ':w<CR>', {})
map('n', '<leader>fr', ':Ag<CR>', {})

-- project
map('n', '<leader>pt', ':NvimTreeToggle<CR>', {})
map('n', '<leader>pf', ':NvimTreeFindFileToggle<CR>', {})

-- git
map('n', '<leader>gs', ':Git<CR>', {})
map('n', '<leader>gd', ':Gdiffsplit<CR>', {})
map('n', '<leader>gb', ':BlamerToggle<CR>', {})

-- test runner
map('n', '<leader>tf', ':TestFile<CR>', {})
map('n', '<leader>tl', ':TestNearest<CR>', {})
map('n', '<leader>te', ':TestEdit<CR>', {})

-- vim-easy-align
map('v', 'ga', ':EasyAlign', {})

-- themes
map('n', '<leader>Ts', ':Colors<CR>', {})
map('n', '<leader>Tn', ':NextColorScheme<CR>', {})
map('n', '<leader>Tp', ':PrevColorScheme<CR>', {})
map('n', '<leader>Tr', ':RandomColorScheme<CR>', {})
map('n', '<leader>Ti', ':colorscheme doom-dark+<CR>', {})

-- lsp
map('n', '<leader>ld', 'Trouble lsp_definitions<CR>', {silent = true, noremap = true})
map('n', '<leader>lr', 'Trouble lsp_references<CR>', {silent = true, noremap = true})
map('n', '<leader>lf', 'Trouble document_diagnostics', {silent = true, noremap = true})
-- I also am mapping the lsp signature help which is set in plugins/lsp.lua

-- window
map('n', '<leader>wq', ':q<CR>', {})
map('n', '<leader>ww', '<C-w>w', {})
map('n', '<leader>ws', '<C-w>s', {})
map('n', '<leader>wv', '<C-w>v', {})
map('n', '<leader>wt', ':vsplit term://zsh<CR>', {})
map('t', '<leader>wc', '<C-\\><C-n>', {noremap = true, silent = true})

-- rails-specific
map('n', '<localleader>r', ':Rails', {})
map('n', '<localleader>rgc', ':Generate controller', {})
map('n', '<localleader>rgm', ':Generate migration', {})
map('n', '<localleader>rnc', ':Econtroller<CR>', {})
map('n', '<localleader>rnm', ':Emodel<CR>', {})
map('n', '<localleader>rnr', ':R<CR>', {})
map('n', '<localleader>rnt', ':A<CR>', {})
map('n', '<localleader>f', 'ggO# frozen_string_literal: true<esc>jO<esc>', {})
