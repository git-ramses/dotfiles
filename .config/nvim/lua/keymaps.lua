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

-- basic nav remap
map('n', '<Space>q', ':q<CR>', {})
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-l>', '<C-w>l', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})

-- nerdtree
map('n', '<C-t>', ':NERDTreeToggle<CR>', {})
map('n', '<C-f>', ':NERDTreeFind<CR>', {})

-- harpoon
map('n', '<Space>ha', ':lua require("harpoon.mark").add_file()<CR>', {})
map('n', '<Space>ht', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
map('n', '<Space>hn', ':lua require("harpoon.ui").nav_next()<CR>', {})
map('n', '<Space>hp', ':lua require("harpoon.ui").nav_prev()<CR>', {})

-- fzf
map('n', '<Space>f', ':Ag<CR>', {})

-- vim-easy-align
map('v', 'ga', ':EasyAlign', {})
