-- ================================================================================================
-- TITLE : LazyVim extras
-- ABOUT :
--   Every "extra" is a ready-made feature pack published by LazyVim.
--   Docs: https://lazyvim.github.io/extras
--
--   IMPORTANT: a few extras are mutually exclusive (you can only have one picker, one file
--   explorer, one completion engine and one start screen). The ones that are left out here
--   are listed at the bottom of this file so you can swap them in whenever you want.
-- ================================================================================================

return {
  -- NOTE: the order of the imports matters for a few extras. `ui.edgy` has to be imported
  -- before `editor.outline`, otherwise edgy does not pick up the outline window.
  { import = "lazyvim.plugins.extras.ui.edgy" }, -- managed window layout

  -- ── Editor ────────────────────────────────────────────────────────────────────────────────
  { import = "lazyvim.plugins.extras.editor.snacks_picker" }, -- file finder / grep / everything (default)
  { import = "lazyvim.plugins.extras.editor.snacks_explorer" }, -- file explorer (default)
  { import = "lazyvim.plugins.extras.editor.outline" }, -- symbol outline
  { import = "lazyvim.plugins.extras.editor.illuminate" }, -- highlight word under cursor
  { import = "lazyvim.plugins.extras.editor.dial" }, -- increment/decrement numbers
  { import = "lazyvim.plugins.extras.editor.leap" }, -- search & jump
  { import = "lazyvim.plugins.extras.editor.inc-rename" }, -- rename symbol everywhere
  { import = "lazyvim.plugins.extras.editor.harpoon2" }, -- quick file navigation
  { import = "lazyvim.plugins.extras.editor.mini-files" }, -- file explorer column
  { import = "lazyvim.plugins.extras.editor.mini-move" }, -- move lines/blocks
  { import = "lazyvim.plugins.extras.editor.mini-diff" }, -- diff mode helpers
  { import = "lazyvim.plugins.extras.editor.overseer" }, -- task runner
  -- NOTE: `editor.aerial` and `editor.refactoring` need Neovim 0.12+, they are commented out
  -- until then. Use `editor.outline` for the symbol outline.
  -- { import = "lazyvim.plugins.extras.editor.aerial" }, -- symbol outline (needs 0.12+)
  -- { import = "lazyvim.plugins.extras.editor.refactoring" }, -- LSP refactorings (needs 0.12+)
  --
  -- NOTE: `ui.alpha` conflicts with the snacks picker in this LazyVim version, so the
  -- snacks dashboard (the default) is used instead.
  -- { import = "lazyvim.plugins.extras.ui.alpha" }, -- classic start screen

  -- ── Coding ────────────────────────────────────────────────────────────────────────────────
  { import = "lazyvim.plugins.extras.coding.blink" }, -- completion engine (default)
  { import = "lazyvim.plugins.extras.coding.mini-comment" }, -- comment plugin
  { import = "lazyvim.plugins.extras.coding.mini-snippets" }, -- snippet engine
  { import = "lazyvim.plugins.extras.coding.mini-surround" }, -- surround add/change/delete
  { import = "lazyvim.plugins.extras.coding.neogen" }, -- AI-ish snippet generator
  { import = "lazyvim.plugins.extras.coding.yanky" }, -- yank & put rings

  -- ── UI ─────────────────────────────────────────────────────────────────────────────────────
  { import = "lazyvim.plugins.extras.ui.indent-blankline" }, -- indent guides
  { import = "lazyvim.plugins.extras.ui.mini-animate" }, -- animations
  { import = "lazyvim.plugins.extras.ui.mini-indentscope" }, -- indent scope
  { import = "lazyvim.plugins.extras.ui.smear-cursor" }, -- cursor trail
  { import = "lazyvim.plugins.extras.ui.treesitter-context" }, -- context of current scope

  -- ── LSP ─────────────────────────────────────────────────────────────────────────────────────
  { import = "lazyvim.plugins.extras.lsp.neoconf" }, -- manage lspconfig from inside neovim
  { import = "lazyvim.plugins.extras.lsp.none-ls" }, -- format & code actions via the LSP

  -- ── Debugging / Testing ───────────────────────────────────────────────────────────────────
  { import = "lazyvim.plugins.extras.dap.core" }, -- nvim-dap
  { import = "lazyvim.plugins.extras.dap.nlua" }, -- debug Lua
  { import = "lazyvim.plugins.extras.test.core" }, -- neotest

  -- ── Formatting / Linting ──────────────────────────────────────────────────────────────────
  { import = "lazyvim.plugins.extras.formatting.black" }, -- python formatter
  { import = "lazyvim.plugins.extras.formatting.prettier" }, -- web formatter
  { import = "lazyvim.plugins.extras.linting.eslint" }, -- eslint

  -- ── Utilities ─────────────────────────────────────────────────────────────────────────────
  { import = "lazyvim.plugins.extras.util.gh" }, -- GitHub CLI integration
  { import = "lazyvim.plugins.extras.util.rest" }, -- REST client (kulala)
  { import = "lazyvim.plugins.extras.util.mini-hipatterns" }, -- highlight words & tailwind classes
  { import = "lazyvim.plugins.extras.util.startuptime" }, -- startup time in the statusline

  -- ── AI ─────────────────────────────────────────────────────────────────────────────────────
  { import = "lazyvim.plugins.extras.ai.copilot" }, -- copilot completion
  { import = "lazyvim.plugins.extras.ai.copilot-chat" }, -- copilot chat

  -- ── Languages ────────────────────────────────────────────────────────────────────────────
  -- Core languages
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.typescript" }, -- vtsls
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.git" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.sql" },
  { import = "lazyvim.plugins.extras.lang.prisma" },

  -- Systems languages
  { import = "lazyvim.plugins.extras.lang.rust" }, -- rustaceanvim
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.clangd" }, -- C / C++
  { import = "lazyvim.plugins.extras.lang.zig" },
  { import = "lazyvim.plugins.extras.lang.cmake" },
  { import = "lazyvim.plugins.extras.lang.terraform" },

  -- Web
  { import = "lazyvim.plugins.extras.lang.php" },
  { import = "lazyvim.plugins.extras.lang.vue" },
  { import = "lazyvim.plugins.extras.lang.svelte" },
  { import = "lazyvim.plugins.extras.lang.astro" },
  { import = "lazyvim.plugins.extras.lang.thrift" },

  -- Other languages
  { import = "lazyvim.plugins.extras.lang.dart" },
  { import = "lazyvim.plugins.extras.lang.gleam" },
  { import = "lazyvim.plugins.extras.lang.solidity" },
  { import = "lazyvim.plugins.extras.lang.elm" },
  { import = "lazyvim.plugins.extras.lang.tex" },
  { import = "lazyvim.plugins.extras.lang.typst" },
  { import = "lazyvim.plugins.extras.lang.helm" },
  { import = "lazyvim.plugins.extras.lang.ansible" },

  -- Languages that need a runtime which is not installed on this machine (JDK 21+, .NET SDK,
  -- Elixir/Erlang, Ruby, R, Nix, julia, php+composer). Uncomment the ones you need - mason
  -- installs the matching server the next time you start Neovim.
  --
  -- { import = "lazyvim.plugins.extras.lang.java" },
  -- { import = "lazyvim.plugins.extras.lang.kotlin" },
  -- { import = "lazyvim.plugins.extras.lang.scala" },
  -- { import = "lazyvim.plugins.extras.lang.clojure" },
  -- { import = "lazyvim.plugins.extras.lang.elixir" },
  -- { import = "lazyvim.plugins.extras.lang.erlang" },
  -- { import = "lazyvim.plugins.extras.lang.dotnet" },
  -- { import = "lazyvim.plugins.extras.lang.ruby" },
  -- { import = "lazyvim.plugins.extras.lang.haskell" },
  -- { import = "lazyvim.plugins.extras.lang.lean" },
  -- { import = "lazyvim.plugins.extras.lang.ocaml" },
  -- { import = "lazyvim.plugins.extras.lang.nushell" },
  -- { import = "lazyvim.plugins.extras.lang.rego" },
  -- { import = "lazyvim.plugins.extras.lang.ember" },
  -- { import = "lazyvim.plugins.extras.lang.r" }, -- needs R
  -- { import = "lazyvim.plugins.extras.lang.nix" }, -- needs the nix binary
  -- { import = "lazyvim.plugins.extras.lang.julia" }, -- needs julia
  -- { import = "lazyvim.plugins.extras.lang.twig" }, -- needs php + composer
}
