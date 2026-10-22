-- ================================================================================================
-- TITLE : Colorschemes
-- ABOUT :
--   LazyVim ships with tokyonight (default) and catppuccin. Both are lazy-loaded by
--   LazyVim, `:colorscheme <name>` loads them on demand.
--   Press <leader>ct to cycle through the themes below.
--
--   Catppuccin Mocha is the startup theme, so the editor, the prompt, tmux, fzf and lazygit are
--   one palette rather than five. LazyVim chooses its startup scheme from its own opts block;
--   setting `install.colorscheme` alone only changes what is drawn during an install.
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
      transparent_background = false,
      -- Colour the plugins that draw their own chrome. The ones listed here are the LazyVim
      -- extras that are actually enabled in this configuration; an unknown key is harmless.
      integrations = {
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        markdown = true,
        mini = true,
        neotree = true,
        noice = true,
        notify = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
