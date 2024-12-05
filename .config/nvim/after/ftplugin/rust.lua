local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>ca", function()
  vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr, desc = "code action" })

vim.keymap.set("n", "<leader>ee", function()
  vim.cmd.RustLsp "explainError"
end, { silent = true, buffer = bufnr, desc = "explain error" })

vim.keymap.set("n", "<leader>oc", function()
  vim.cmd.RustLsp "openCargo"
end, { silent = true, buffer = bufnr, desc = "open Cargo" })

vim.keymap.set("n", "K", function()
  vim.cmd.RustLsp { "hover", "actions" }
end, { silent = true, buffer = bufnr, desc = "hover action" })

vim.keymap.set("n", "<leader>ddd", function()
  vim.cmd.RustLsp "debug"
end, { silent = true, buffer = bufnr, desc = "launch rust debug" })

vim.keymap.set("n", "<leader>dr", function()
  vim.cmd.RustLsp "runnables"
end, { silent = true, buffer = bufnr, desc = "rust runnables" })

vim.keymap.set("n", "<leader>dds", function()
  vim.cmd.RustLsp "debuggables"
end, { silent = true, buffer = bufnr, desc = "rust debuggables" })

-- rustaceanvim uses rust-analyzer to find the list of possible targets to debug, but rust-analyzer
-- only returns targets for the current file. Since I mostly work on binaries with library modules
-- in the same project, go to main.rs, start the debugger, and then come back to the current module.
local function debug_rust_main(bang)
  local main_rs_path = vim.fn.findfile("main.rs", ".;")
  local current_path = vim.fn.expand('%')
  if main_rs_path == "" then
    error("Could not find main.rs in debug_rust_main()")
    return
  end

  vim.cmd("edit " .. main_rs_path)
  if bang then
    vim.cmd("RustLsp! debuggables")
  else
    vim.cmd("RustLsp debuggables")
  end
  vim.cmd("edit " .. current_path)
end

vim.keymap.set("n", "<leader>dm", debug_rust_main, { silent = true, buffer = bufnr, desc = "debug rust main" })
