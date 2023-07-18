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
mkdir ~/.config/nvim/lua/plugins     -- directory to store plugin-specific configuration
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
│   ├── plugins.lua
│   └── themes.lua
└── plugin -- note this directory is automatically created when you first compile and install Packer
    └── packer_compiled.lua
```

3. See the appropriately named files for each of the above created new files and fill in appropriately.
> Note: The keymaps are based on my usage preference, feel free to customize to your liking.

### Plugin installation using Packer
1. After defining the plugins to use in `~/.config/nvim/lua/plugins.lua`, run `:PackerInstall` to install all of the plugins.

## Setting up a LSP client in Neovim
If you want a LSP (language server protocol) setup in neovim so you can do cool things like code completion, go to definition, documentation on hover, format, rename and refactor, read below.

  - If using Ruby, setup [Solargraph](http://solargraph.org/) locally in the git repo of your choice using `gem install solargraph`
  - Add both of the below plugins to your `~/.config/nvim/lua/plugins.lua`

```lua
  use { 'neovim/nvim-lspconfig' }
  use { 'neoclide/coc.nvim', branch = 'release' }
```
  - Create a new file `~/.config/nvim/lua/plugins/lsp.lua` and add the config found in `~/.config/nvim/lua/plugins/lsp.lua` in this project
  - Install the solargraph language server in Coc using `:CocInstall coc-solargraph`
  - Create a new file `~/.config/nvim/lua/plugins/coc.lua` and add the config found in `~/.config/nvim/lua/plugins/coc.lua` in this project

  - Test that the coc-solargraph has attached and is running, execute `:CocInfo` and you should see something like:
```ruby
...
## Log of coc.nvim

2023-07-18T16:28:11.745 INFO (pid:68162) [plugin] - coc.nvim initialized with node: v18.17.0 after 226
2023-07-18T16:28:11.911 INFO (pid:68162) [extension:coc-solargraph] - Solargraph is listening PORT=49449 PID=68206
...
```



