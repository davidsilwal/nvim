-- ================================================================================================
-- TITLE : AI
-- ABOUT :
--   GitHub Copilot for completion + chat. The extras themselves live in lua/extras.lua.
--   After the first start run `:Copilot auth` once to sign in.
-- ================================================================================================

return {
  {
    "zbirenbaum/copilot.lua",
    -- the default build step runs the interactive login, which blocks a headless install.
    -- run `:Copilot auth` manually instead.
    build = false,
  },
}
