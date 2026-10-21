-- ================================================================================================
-- TITLE : Popular community plugins
-- ABOUT :
--   The plugins below are not part of LazyVim but are widely used and worth adding.
-- ================================================================================================

return {
  -- ── Zen mode ────────────────────────────────────────────────────────────────────────────────
  {
    "folke/zen-mode.nvim",
    cmd = "Zen",
    opts = {
      window = {
        width = 0.9,
        height = 0.9,
      },
    },
  },

  -- ── Navigate between Neovim and tmux panes ─────────────────────────────────────────────────
  -- NOTE: add the tmux integration to your ~/.tmux.conf, see README.md
  {
    "numToStr/Navigator.nvim",
    event = "VeryLazy",
    keys = {
      { "<A-h>", "<Cmd>NavigatorLeft<CR>", desc = "Navigate Left" },
      { "<A-j>", "<Cmd>NavigatorDown<CR>", desc = "Navigate Down" },
      { "<A-k>", "<Cmd>NavigatorUp<CR>", desc = "Navigate Up" },
      { "<A-l>", "<Cmd>NavigatorRight<CR>", desc = "Navigate Right" },
    },
    opts = {},
    config = function(_, opts)
      require("Navigator").setup(opts)
    end,
  },

  -- ── Debugger UI ────────────────────────────────────────────────────────────────────────────
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval (DAP UI)" },
    },
    opts = {
      icons = { expanded = "", collapsed = "", current_frame = "" },
      mappings = {
        -- stylua: ignore
        ["n"] = {
          ["<space>"] = { function() require("dapui").eval() end, { desc = "Eval" } },
        },
      },
    },
    config = function(_, opts)
      require("dapui").setup(opts)
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "rcarriga/nvim-dap-ui" },
    opts = {
      commented = true,
    },
  },

  -- ── Breadcrumbs in the winbar ─────────────────────────────────────────────────────────────
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>;", function() require("dropbar.api").pick() end, desc = "Pick symbol in winbar" },
      { "[;", function() require("dropbar.api").goto_context_start() end, desc = "Go to context start" },
      { "];", function() require("dropbar.api").select_next_context() end, desc = "Select next context" },
    },
    opts = {},
  },
}
