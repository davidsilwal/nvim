# Neovim configuration (LazyVim)

A full-featured [LazyVim](https://github.com/LazyVim/LazyVim) setup, installed from the official
starter template and extended with every useful extra.

```
~/.config/nvim
├── init.lua                  # boots lazy.nvim
├── lazyvim.json              # LazyVim state (managed extras, version, ...)
├── lazy-lock.json            # pinned plugin versions (commit this!)
├── lua
│   ├── extras.lua            # all enabled LazyVim extras
│   ├── config
│   │   ├── autocmds.lua      # your autocmds (trim whitespace, markdown tweaks, ...)
│   │   ├── keymaps.lua       # your keymaps
│   │   ├── lazy.lua          # lazy.nvim setup (the file you really need to touch)
│   │   └── options.lua       # your options
│   └── plugins
│       ├── ai.lua            # GitHub Copilot (completion + chat)
│       ├── mason.lua         # external tools managed by mason
│       ├── optional.lua      # plugins that need personal setup (obsidian, markdown preview)
│       ├── popular.lua       # popular community plugins (zen, dap-ui, dropbar, tmux nav)
│       └── theme.lua         # colorschemes (tokyonight + catppuccin)
└── stylua.toml               # lua formatter config
```

## Getting started

```sh
nvim                 # first start: lazy.nvim installs the plugins, mason installs the tools
nvim                 # second start: everything is ready
```

Useful commands:

| command | what it does |
| --- | --- |
| `:Lazy` | open the plugin manager UI |
| `:LazyExtras` | browse/toggle LazyVim extras |
| `:Mason` | manage external tools (formatters, linters, ...) |
| `:checkhealth` | health check of Neovim and the plugins |
| `:Copilot auth` | sign in to GitHub Copilot (needed once) |

## Keymaps

Everything LazyVim provides plus:

| key | action |
| --- | --- |
| `<leader>w` | write file |
| `<leader>q` | quit window |
| `<leader>tt` | toggle terminal |
| `<leader>yp` / `<leader>yP` | yank relative / absolute path |
| `<leader>ct` | cycle colorscheme (tokyonight ↔ catppuccin) |
| `<leader>du` / `<leader>de` | toggle / eval the DAP UI |
| `<leader>;` | pick a symbol in the winbar (dropbar) |
| `<A-h/j/k/l>` | navigate to the tmux pane next to Neovim |

Run `:LazyVimKeymaps` (or `:h lazyvim-keymaps`) for the complete list.

## What is enabled

* **Picker / explorer**: `snacks.picker` + `snacks.explorer` (the LazyVim defaults)
* **Completion**: `blink.cmp`
* **Start screen**: the `snacks` dashboard
* **LSP**: `nvim-lspconfig` + `mason`, with `neoconf` and `none-ls`
* **Treesitter**: syntax highlighting, incremental selection and context
* **Debugging**: `nvim-dap` (+ `nvim-dap-ui`, `nvim-dap-virtual-text`)
* **Testing**: `neotest`
* **Git**: `gitsigns`, `lazygit`, `gh` CLI integration, `mini.diff`
* **AI**: GitHub Copilot completion and chat

The full list of extras lives in `lua/extras.lua`.

### Swapping a component

Only one picker, one explorer, one completion engine and one start screen can be active. To swap
one, comment the current import out and enable the alternative in `lua/extras.lua`:

```lua
-- { import = "lazyvim.plugins.extras.editor.snacks_picker" },
{ import = "lazyvim.plugins.extras.editor.telescope" }, -- or editor.fzf

-- { import = "lazyvim.plugins.extras.editor.snacks_explorer" },
{ import = "lazyvim.plugins.extras.editor.neo-tree" },

-- { import = "lazyvim.plugins.extras.coding.blink" },
{ import = "lazyvim.plugins.extras.coding.nvim-cmp" },

-- { import = "lazyvim.plugins.extras.ui.alpha" },  -- conflicts with the snacks picker
-- { import = "lazyvim.plugins.extras.ui.dashboard-nvim" }, -- or ui.mini-starter
```

Two extras need Neovim 0.12+ and are therefore disabled: `editor.aerial` (use `editor.outline`)
and `editor.refactoring`.

## Languages

`lua/extras.lua` enables: python, typescript (vtsls), json, yaml, toml, markdown, git, docker,
tailwind, sql, prisma, rust, go, clangd (C/C++), zig, cmake, terraform, php, vue, svelte, astro,
thrift, dart, gleam, solidity, elm, tex, typst, helm, ansible.

Languages that need a runtime which is not installed on this machine (java, kotlin, scala, clojure,
elixir, erlang, dotnet, ruby, haskell, lean, ocaml, nushell, rego, ember, r, nix, julia, twig) are
listed as commented out imports at the bottom of `lua/extras.lua` - uncomment the ones you need,
install the matching runtime and mason will fetch the server on the next start.

## tmux integration

`numToStr/Navigator.nvim` moves the focus between Neovim and the neighbouring
tmux pane with `<A-h/j/k/l>`. It does the tmux half itself -- it runs
`tmux select-pane` and refuses to move while a pane is zoomed -- and it
detects tmux on its own, so there is nothing to add to `tmux.conf`.

What the tmux configuration does have is the usual `prefix + h/j/k/l` for
moving between panes: the same gesture, for the focus that is in tmux rather
than in the editor.

## System requirements

```sh
sudo apt-get install unzip zip python3-pip python3-venv luarocks
```

* `unzip` - mason needs it to unpack most LSP servers
* `pip` - for the python based tools (black, sqlfluff, ...); mason runs with
  `PIP_BREAK_SYSTEM_PACKAGES=1` because Ubuntu marks python as externally managed (PEP 668)
* `luarocks` - installs `luacheck`
* `node` - for prettier, eslint and the typescript language server
* `go` - for gofumpt/goimports/golangci-lint (the `gopls` server works without it)

## Housekeeping

```sh
git init && git add . && git commit -m "feat: lazyvim setup"   # version your config
nvim --headless "+Lazy! update" +qa                            # update all plugins
nvim --headless "+Lazy! sync" +qa                              # install missing plugins
```

`lazy-lock.json` pins every plugin to a commit - commit it together with the rest of the config so
the same setup can be restored on another machine with `git clone && nvim`.

## Previous configuration

The configuration that was replaced by this one is kept as a backup:

```
~/.config/nvim.bak.20261020-204351
~/.local/share/nvim.bak.20261020-204351
```

Move it back to `~/.config/nvim` if you want to go back.
