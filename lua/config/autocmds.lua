-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

-- highlight the yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "Search", timeout = 150 })
  end,
})

-- markdown: conceal + spell check + soft wrap
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "markdown_inline" },
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- git commit messages: spell check + comment chars
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.comments = ":#"
    vim.opt_local.commentstring = "# %s"
  end,
})

-- trim trailing whitespace on save (but not for every filetype)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = { "*" },
  callback = function()
    if vim.bo.filetype == "" or vim.bo.buftype ~= "" then
      return
    end
    -- markdown uses trailing whitespace for hard line breaks
    if vim.bo.filetype:match("^markdown") then
      return
    end
    local view = vim.fn.winsaveview()
    vim.cmd("silent! keeppatterns %s/\\s\\+$//e")
    vim.fn.winrestview(view)
  end,
})
