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
