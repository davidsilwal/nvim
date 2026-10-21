-- ================================================================================================
-- TITLE : Optional / personal plugins
-- ABOUT :
--   Plugins that were part of the previous configuration and that need a bit of personal
--   setup. Uncomment the ones you want and fill in the paths.
-- ================================================================================================

return {
  -- ── Obsidian ────────────────────────────────────────────────────────────────────────────────
  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "^4.0.0",
  --   opts = {
  --     dir = vim.fn.expand("~/vaults/personal"), -- path to your vault
  --     workspaces = {
  --       {
  --         name = "personal",
  --         path = vim.fn.expand("~/vaults/personal"),
  --         strict = false,
  --       },
  --     },
  --     ui = { enable = true, update_check = { enable = false } },
  --   },
  -- },

  -- ── Markdown preview ────────────────────────────────────────────────────────────────────────
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = "cd markdown-preview.nvim && npm install",
  --   keys = {
  --     { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
  --   },
  --   init = function()
  --     vim.g.mkdp_auto_start = 0
  --   end,
  -- },
}
