local M = {
  "andrewferrier/wrapping.nvim",
  event = "VeryLazy",
}

local opts = {
  auto_set_mode_filetype_allowlist = {
    "asciidoc",
    "gitcommit",
    "latex",
    "mail",
    "markdown",
    "rst",
    "tex",
    "text",
  },
}

function M.config()
  require("wrapping").setup(opts)
end

return M
