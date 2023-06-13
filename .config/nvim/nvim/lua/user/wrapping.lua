local M = {
    "andrewferrier/wrapping.nvim",
    event = "VeryLazy",
}

function M.config()
  require("wrapping").setup()
end

return M
