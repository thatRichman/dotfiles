local M = {
  "mfussenegger/nvim-dap-python",
  commit = "9af9f966f25f2132e042776bdcbe45af8cb59235",
  event = "VeryLazy",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      event = "VeryLazy",
    },
  },
}

function M.config()
  require("dap-python").setup("python3")
end

return M
