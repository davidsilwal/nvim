-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Editing feel
vim.opt.smoothscroll = true -- scroll by pixels, not lines
vim.opt.scrolloff = 8 -- keep 8 lines of context above/below the cursor
vim.opt.sidescrolloff = 8 -- keep 8 columns of context left/right of the cursor
vim.opt.splitright = true -- new splits open to the right
vim.opt.splitbelow = true -- new splits open below
vim.opt.confirm = true -- ask before quitting with unsaved changes
vim.opt.undofile = true -- persistent undo across sessions
vim.opt.termguicolors = true -- 24-bit colors
vim.opt.showmode = false -- the mode is already shown in the statusline

-- Completion / LSP
vim.opt.completeopt = { "menuone", "noselect" }

-- Window management
vim.opt.winborder = "rounded"

-- Clipboard: only enable when a clipboard provider is actually available
local function has_clipboard()
  if vim.fn.has("xclip") == 1 or vim.fn.has("xsel") == 1 or vim.fn.has("wl-copy") == 1 then
    return true
  end
  if vim.fn.has("macOS") == 1 then
    return true
  end
  if vim.fn.has("wsl") == 1 then
    return true
  end
  return false
end
if has_clipboard() then
  vim.opt.clipboard = { "unnamedplus", "unnamed" }
end
