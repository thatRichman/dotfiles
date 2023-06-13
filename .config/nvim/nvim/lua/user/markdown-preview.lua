local M = {
  "iamcco/markdown-preview.nvim",
  commit = "*"
}

function M.config()
  vim.fn["mkdp#util#install"]()
end

return M
