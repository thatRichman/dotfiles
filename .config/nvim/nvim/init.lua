require "options"
require "keymaps"
require "Lazy"
require "autocommands"
require "leap"

-- Disable netrw -- 
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- relative line numbering --
vim.wo.relativenumber = true

-- highlight trailing whitespace --
vim.fn.matchadd('errorMsg', [[\s\+$]])

vim.opt.background = "dark"
