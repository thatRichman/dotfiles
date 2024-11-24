local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "*",
  event = "BufReadPost",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
      commit = "*"
    },
  },
}
function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {}
end

return M
