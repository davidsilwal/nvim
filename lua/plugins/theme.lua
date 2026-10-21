-- ================================================================================================
-- TITLE : Colorschemes
-- ABOUT :
--   LazyVim ships with tokyonight (default) and catppuccin. Both are lazy-loaded by
--   LazyVim, `:colorscheme <name>` loads them on demand.
--   Press <leader>ct to cycle through the themes below.
-- ================================================================================================

return {
  {
    "folke/tokyonight.nvim",
    opts = { style = "moon" },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    },
  },
}
