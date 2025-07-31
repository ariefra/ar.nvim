local map = vim.api.nvim_set_keymap

-- general mappings
map('n', '<leader>q', '<cmd>confirm qa<cr>', { desc = 'Close all' })
map('n', '<leader>!q', '<cmd>qa!<cr>', { desc = 'Force Close all' })
map('n', '<leader>x', '<cmd>confirm bd<cr>', { desc = 'Close' })
map('n', '<leader>!x', '<cmd>bd!<cr>', { desc = 'Force Close' })
map('n', '<leader><leader>', '<cmd>noh<cr>', { desc = 'No Highlight' })
map('n', '<leader>vl', '<cmd>Lazy profile<cr>', { desc = 'Lazy Profile' })
map('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<cr>', { desc = 'Diagnostic' })
map('n', '<c-s>', '<cmd>w<cr><cmd>lua vim.notify("saving files", vim.log.levels.INFO)<cr>', { desc = 'File Save' })
map('n', '<Bslash>t', '<cmd>lua require("base.transparency").toggle()<cr>', { desc = 'Toggle Transparency' })
-- codeium
-- vim.keymap.set('i', '<tab>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
-- shorthands
vim.cmd ':cabbrev vh vert h'
return {}
