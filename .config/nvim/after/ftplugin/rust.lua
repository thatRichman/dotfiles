local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>ca", function()
  vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr, desc="code action"})

vim.keymap.set("n", "<leader>ee", function()
  vim.cmd.RustLsp "explainError"
end, { silent = true, buffer = bufnr, desc="explain error"})

vim.keymap.set("n", "<leader>oc", function()
  vim.cmd.RustLsp "openCargo"
end, { silent = true, buffer = bufnr, desc="open Cargo"})

vim.keymap.set("n", "K", function()
  vim.cmd.RustLsp { "hover", "actions" }
end, { silent = true, buffer = bufnr, desc = "hover action" })

vim.keymap.set("n", "<leader>db", function()
  vim.cmd.RustLsp "debug"
end, { silent = true, buffer = bufnr, desc = "launch rust debug"})
