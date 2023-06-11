local M = {
  "sainnhe/gruvbox-material",
  commit = "*",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "gruvbox-material"
function M.config()
  vim.opt.background = "dark"
  vim.g.gruvbox_material_background = "hard"
  vim.g.gruvbox_material_better_performance = "true"
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
