-- ================================================================================================
-- TITLE : lazy.nvim bootstrap + LazyVim
-- ABOUT :
--   * bootstraps lazy.nvim (cloned once into stdpath("data")/lazy/lazy.nvim)
--   * registers LazyVim as the plugin "distro" and imports our own specs from lua/plugins
--   * plugin specs live in lua/plugins/*.lua and are auto-imported by the { import = "plugins" }
--     entry below, so this file stays tiny and focused on lazy.nvim behaviour only.
-- LINKS :
--   > lazy.nvim   : https://github.com/folke/lazy.nvim
--   > LazyVim     : https://github.com/LazyVim/LazyVim
--   > LazyVim docs: https://lazyvim.github.io
-- ================================================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- LazyVim itself: the distro that provides all default plugins/options/keymaps
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- the LazyVim extras we enable (lua/extras.lua).
    -- NOTE: the extras have to be imported BEFORE our own plugins, LazyVim checks that order.
    { import = "extras" },
    -- everything under lua/plugins/*.lua is imported here (themes, mason tools, ...)
    { import = "plugins" },
  },
  defaults = {
    -- LazyVim plugins keep their own lazy/event settings; our own specs stay eager by default
    lazy = false,
    -- always track the latest commit of every plugin (stable, no stale pinned releases)
    version = false,
  },
  install = {
    -- the colorscheme that LazyVim uses at startup (see lua/plugins/theme.lua)
    colorscheme = { "tokyonight", "habamax" },
  },
  -- check for plugin updates in the background
  checker = {
    enabled = true,
    notify = false,
  },
  -- don't spam notifications when plugin files change on disk
  change_detection = {
    notify = false,
  },
  ui = {
    border = "rounded",
  },
  git = {
    -- give slow networks more time to clone plugins
    timeout = 120,
  },
  performance = {
    rtp = {
      -- disable plugins that ship with Neovim but that we never use
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
