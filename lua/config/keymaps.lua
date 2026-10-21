-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- ── Files ──────────────────────────────────────────────────────────────────────────────────────
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Write File" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit Window" })

-- ── Terminal ──────────────────────────────────────────────────────────────────────────────────
map("n", "<leader>tt", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })

-- ── Paths ─────────────────────────────────────────────────────────────────────────────────────
map("n", "<leader>yp", function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
  vim.fn.setreg('"', path)
  vim.notify("Yanked: " .. path)
end, { desc = "Yank Relative Path" })

map("n", "<leader>yP", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg('"', path)
  vim.notify("Yanked: " .. path)
end, { desc = "Yank Absolute Path" })

-- ── Misc ──────────────────────────────────────────────────────────────────────────────────────
map("n", "<leader>ch", function() Snacks.picker.command_history() end, { desc = "Command History" })

-- ── Theme ─────────────────────────────────────────────────────────────────────────────────────
local themes = {
  { name = "tokyonight", desc = "TokyoNight (moon)" },
  { name = "catppuccin", flavour = "mocha", desc = "Catppuccin (mocha)" },
  { name = "catppuccin", flavour = "latte", desc = "Catppuccin (latte)" },
}

map("n", "<leader>ct", function()
  local current = vim.g.colors_name
  local idx = 1
  for i, theme in ipairs(themes) do
    if theme.name == current then
      idx = i % #themes + 1
      break
    end
  end
  local theme = themes[idx]
  -- the first call loads the (lazy) colorscheme plugin
  vim.cmd.colorscheme(theme.name)
  if theme.flavour then
    require("catppuccin").flavour = theme.flavour
    vim.cmd.colorscheme(theme.name)
  end
  vim.notify("Colorscheme: " .. theme.desc, vim.log.levels.INFO, { title = "Theme" })
end, { desc = "Cycle Colorscheme" })
