local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  -- api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- For more mappings, see https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L1946C8-L1946C8
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,           opts('Help'))
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,             opts('Open'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,  opts('Toggle Dotfiles'))
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'oh',    api.node.open.vertical,         opts('Open: Vertical Split'))
  vim.keymap.set('n', 'ov',    api.node.open.horizontal,       opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'a',     api.fs.create,                  opts('Create'))
  vim.keymap.set('n', 'r',     api.fs.rename,                  opts('Rename'))
  vim.keymap.set('n', 'd',     api.fs.remove,                  opts('Delete'))
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,      opts('Copy Absolute Path'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,           opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,      opts('Copy Relative Path'))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
