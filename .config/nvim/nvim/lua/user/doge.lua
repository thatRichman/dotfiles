local M = {
  "kkoomen/vim-doge",
  event = "VimEnter",
  build = ":call doge#install()",
}

function M.config()
  vim.g.doge_javascript_settings = {
    destructuring_props = 0,
    omit_redundant_param_types = 1,
  }
  vim.api.nvim_set_var("doge_doc_standard_python", "doxygen")
end

return M
