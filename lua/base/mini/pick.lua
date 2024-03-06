return {
	{
		'https://github.com/echasnovski/mini.pick.git',
		keys = {
			{ '<F1>', '<cmd>Pick help<cr>', desc = 'Help Index' },
			{ '<F2>', '<cmd>Pick oldfiles<cr>', desc = 'Recent Files' },
			{ '<F3>', '<cmd>Pick files<cr>', desc = 'Find Files' },
			{ '<F5>', '<cmd>Pick buffers<cr>', desc = 'Buffers' },
			{ '<F6>', '<cmd>Pick grep_live<cr>', desc = 'Grep Live' },
			{ '<F7>', '<cmd>Pick grep<cr>', desc = 'Grep Pattern' },
			{ '<F8>', '<cmd>Pick explorer<cr>', desc = 'Explorer' },
			{ '<leader>tb', '<cmd>Pick buffers<cr>', desc = 'Buffers' },
			{ '<leader>te', '<cmd>Pick explorer<cr>', desc = 'Explorer' },
			{ '<leader>tf', '<cmd>Pick files<cr>', desc = 'Find Files' },
			{ '<leader>tg', '<cmd>Pick grep<cr>', desc = 'Grep Pattern' },
			{ '<leader>tl', '<cmd>Pick grep_live<cr>', desc = 'Grep Live' },
			{ '<leader>to', '<cmd>Pick oldfiles<cr>', desc = 'Recent Files' },
		},
		cmd = { 'Pick' },
		dependencies = { 'https://github.com/echasnovski/mini.extra.git' },
    opts ={},
		config = function()
			local win_config = function()
				local height = math.floor(0.4 * vim.o.lines)
				local width = math.floor(0.7 * vim.o.columns)
				return {
					anchor = 'NW',
					height = height,
					width = width,
					row = math.floor(0.5 * (vim.o.lines - height)),
					col = math.floor(0.5 * (vim.o.columns - width)),
					border = 'none',
				}
			end
			require('mini.extra').setup {}
			require('mini.pick').setup {
				options = { use_cache = true },
				window = { config = win_config },
			}
			-- overide vim.ui.select
			vim.ui.select = function(items, opts, on_choice) require('mini.pick').ui_select(items, opts, on_choice) end
		end,
	},
}
