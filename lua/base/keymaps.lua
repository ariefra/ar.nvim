--stylua: ignore
local map = vim.api.nvim_set_keymap

-- general mappings
map('n', '<leader>q', '<cmd>confirm qa<cr>', { desc = 'Close all' })
map('n', '<leader>!q', '<cmd>qa!<cr>', { desc = 'Force Close all' })
map('n', '<leader>x', '<cmd>bd<cr>', { desc = 'Close' })
map('n', '<leader>!x', '<cmd>bd!<cr>', { desc = 'Force Close' })
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
map('n', '<leader>m', '<cmd>Mason<cr>', { desc = 'Mason' })
map('n', '<leader><leader>', '<cmd>noh<cr>', { desc = 'No Highlight' })
-- map('i', '<tab>', '<cmd>call codeium#Accept()<cr>', { desc = 'Codeium Accept' })
vim.keymap.set('i', '<tab>', function()
	return vim.fn['codeium#Accept']()
end, { expr = true, silent = true })

vim.cmd ':cabbrev vh vert h'

return {}
