local M = {
  "puremourning/vimspector",
  commit = "8968291813",
  event = "VeryLazy",
}

function M.config()
    vim.g.vimspector_enable_mappings = 'HUMAN'
    vim.g.vimspector_install_gadgets = { 'debugpy', '', 'CodeLLDB' }

    -- nmap <leader>bd :call vimspector#Launch()<CR>
    -- nmap <leader>dx :VimspectorReset<CR>
    -- nmap <leader>de :VimspectorEval
    -- nmap <leader>dw :VimspectorWatch
    -- nmap <leader>do :VimspectorShowOutput
    -- nmap <Leader>di <Plug>VimspectorBalloonEval
    -- xmap <Leader>di <Plug>VimspectorBalloonEval
    -- into lua config
    vim.api.nvim_set_keymap('n', '<leader>bd', ':call vimspector#Launch()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>dx', ':VimspectorReset<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>de', ':VimspectorEval', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>dw', ':VimspectorWatch', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>do', ':VimspectorShowOutput', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>di', '<Plug>VimspectorBalloonEval', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('x', '<leader>di', '<Plug>VimspectorBalloonEval', { noremap = true, silent = true })

  end

return M
