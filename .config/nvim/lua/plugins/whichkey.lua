local wk = require("which-key")

wk.register({
  b = {
    name = "+buffer",
    b = { "<cmd>Buffers<cr>", "List buffers" },
    n = { "<cmd>bnext<cr>", "Next buffer" },
    p = { "<cmd>bprevious<cr>", "Previous buffer" },
    d = { "<cmd>bdelete<cr>", "Delete buffer" },
  },
  f = {
    name = "+file",
    f = { "<cmd>Files<cr>", "Find file" },
    s = { "<cmd>w<cr>", "Save file" },
    r = { "<cmd>Ag<cr>", "Search in files" },
  },
  h = {
    name = "+harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
    t = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle quick menu" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Navigate next" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Navigate prev" },
  },
  p = {
    name = "+project",
    t = { "<cmd>NvimTreeToggle<cr>", "Toggle tree" },
    f = { "<cmd>NvimTreeFindFileToggle<cr>", "Find in tree" },
  },
  g = {
    name = "+git",
    s = { "<cmd>Git<cr>", "Launch git" },
    d = { "<cmd>Gdiffsplit<cr>", "Diff split" },
    b = { "<cmd>BlamerToggle<cr>", "Toggle blame" },
  },
  t = {
    name = "+test",
    f = { "<cmd>TestFile<cr>", "Run tests for current file" },
    l = { "<cmd>TestNearest<cr>", "Test nearest assertion" },
    e = { "<cmd>TestEdit<cr>", "Open test for current file" },
  },
  T = {
    name = "+theme",
    s = { "<cmd>Colors<cr>", "List themes" },
    n = { "<cmd>NextColorScheme<cr>", "Next theme" },
    p = { "<cmd>PrevColorScheme<cr>", "Previous theme" },
    r = { "<cmd>RandomColorScheme<cr>", "Random theme" },
    i = { "<cmd>colorscheme doom-dark+<cr>", "Reset theme" },
  },
  l = {
    name = "+lsp",
    d = { "<cmd>Trouble lsp_definitions<cr>", "Jump to definition" },
    r = { "<cmd>Trouble lsp_references<cr>", "List references" },
    h = { "<cmd>Trouble document_diagnostics<cr>", "Document diagnostics" },
    s = { "<cmd>lua vim.lsp.buf.signature_help<cr>", "Signature help" },
  },
  w = {
    name = "+window",
    q = { "Quit a window" },
    w = { "Switch windows" },
    s = { "Split window" },
    v = { "Vertical split window" }
  }
}, { prefix = "<leader>"})
