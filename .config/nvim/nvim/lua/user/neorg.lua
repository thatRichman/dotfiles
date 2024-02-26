local M = {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},      -- Loads default behaviour
      ["core.concealer"] = {},     -- Adds pretty icons to your documents
      ["core.dirman"] = {          -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
            rfd = "~/rfd"
          },
        },
      },
    },
  }
end

return M
