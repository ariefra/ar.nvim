local map = vim.api.nvim_set_keymap

-- general mappings
map('n', '<leader>q', '<cmd>confirm qa<cr>', { desc = 'Close all' })
map('n', '<leader>!q', '<cmd>qa!<cr>', { desc = 'Force Close all' })
map('n', '<leader>x', '<cmd>confirm bd<cr>', { desc = 'Close' })
map('n', '<leader>!x', '<cmd>bd!<cr>', { desc = 'Force Close' })
map('n', '<leader>l', '<cmd>Lazy profile<cr>', { desc = 'Lazy' })
map('n', '<leader><leader>', '<cmd>noh<cr>', { desc = 'No Highlight' })
map('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<cr>', { desc = 'Diagnostic' })
-- codeium
-- vim.keymap.set('i', '<tab>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
-- shorthands

vim.cmd ':cabbrev vh vert h'

return {}
