# dotfiles
Backup of local dotfiles, mainly for nvim configuration.

## Setting up Neovim
1. Install latest neovim version - https://github.com/neovim/neovim/wiki/Installing-Neovim
2. Setup local neovim configuration structure

```lua
-- check if ~/.config/nvim exists and create it if it doesn't
mkdir ~/.config/nvim

-- create an init.lua file in the above created nvim directory
touch ~/.config/nvim/init.lua

-- create a lua directory and additional configuration files
mkdir ~/.config/nvim/lua
touch ~/.config/nvim/lua/options.lua -- default vim-specific settings (defines visual and behavioral preferences)
touch ~/.config/nvim/lua/keymaps.lua -- preferred keybind mappings go here
touch ~/.config/nvim/lua/plugins.lua -- plugin management (not for plugin-specific settings)
touch ~/.config/nvim/lua/themes.lua  -- theme-specific settings
```

3. Your tree structure should look like the following:
```lua
-- tree ~/.config/nvim
├── init.lua
├── lua
│   ├── keymaps.lua
│   ├── options.lua
│   ├── plugins
│   │   └── lsp.lua
│   ├── plugins.lua
│   └── themes.lua
└── plugin -- note this directory is automatically created when you first compile and install Packer
    └── packer_compiled.lua
```

3. See the appropriately named files for each of the above created new files and fill in appropriately.
> Note: The keymaps are based on my usage preference, feel free to customize to your liking.

## Setting up a LSP client in Neovim
If you want a LSP setup (language server protocol) in neovim so you can do cool things like code completion, go to definition, documentation on hover, format, rename and refactor, read below.
  - If using Ruby, setup Solargraph locally in the git repo of your choice using `gem install solargraph`
  - Add both of the below plugins to your `~/.config/nvim/lua/plugins.lua` (if not already there)
```lua
  use { 'neovim/nvim-lspconfig' }
  use { 'neoclide/coc.nvim', branch = 'release' }
```
  - Create a new `plugins` directory under `~/.config/nvim/lua` using `mkdir ~/.config/nvim/lua/plugins` and create a new file `touch ~/.config/nvim/lua/plugins/lsp.lua` and add the following:
```lua
require'lspconfig'.solargraph.setup{}

local nvim_lsp = require('lspconfig')

---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--  --Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	--  -- Mappings.
	local opts = { noremap=true, silent=true }

	--  -- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	-- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

---- Use a loop to conveniently call 'setup' on multiple servers and
---- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	}
end

```
  - Add the following keymaps to your `~/.config/nvim/lua/keymaps.lua` file (these are to make your life easier with using coc)
```lua
-- coc
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
map('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
map('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
```
  - Lastly, require the new `plugins/lsp.lua` module into your options config
```lua
-- ~/.config/nvim/lua/options.lua
-- at the end of the file
require("plugins.lsp")
```
