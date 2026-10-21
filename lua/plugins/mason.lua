-- ================================================================================================
-- TITLE : Mason tools
-- ABOUT :
--   mason manages external tools (formatters, linters, debuggers, ...).
--   The LSP servers themselves are installed automatically by mason-lspconfig for every
--   language extra that is enabled (see lua/plugins/langs.lua).
--
--   NOTE: only list tools here that are NOT already managed by one of the enabled extras.
--         Requesting the same package from two places at the same time makes mason abort
--         with "Package is already installing".
--   Docs: https://lazyvim.github.io/extras/lang/python
-- ================================================================================================

return {
  {
    "mason-org/mason.nvim",
    init = function()
      -- Ubuntu/Ubuntu mark the system python as "externally managed" (PEP 668).
      -- mason installs python based tools (black, sqlfluff, ...) with `pip install --user`,
      -- which pip refuses to do without this flag.
      if not vim.env.PIP_BREAK_SYSTEM_PACKAGES then
        vim.env.PIP_BREAK_SYSTEM_PACKAGES = "1"
      end
    end,
    opts = {
      ensure_installed = {
        -- formatters
        "stylua", -- also the LazyVim default
        "shfmt", -- also the LazyVim default
        "taplo",
        "clang-format",

        -- linters
        "shellcheck",
        "eslint-lsp",
        "luacheck",
        "vale",
        "yamllint",
        "selene",

        -- misc
        "jq",
        "yq",
        "tree-sitter-cli",
        "actionlint",
      },
    },
  },
}
