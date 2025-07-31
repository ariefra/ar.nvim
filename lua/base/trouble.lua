return {
	{
		'https://github.com/folke/trouble.nvim.git',
		cmd = 'Trouble',
		keys = {
			{
				'<leader>vtd',
				'<cmd>Trouble diagnostics toggle<cr>',
				desc = 'Diagnostics (Trouble)',
			},
			{
				'<leader>vtb',
				'<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
				desc = 'Buffer Diagnostics (Trouble)',
			},
			{
				'<leader>vts',
				'<cmd>Trouble symbols toggle focus=false<cr>',
				desc = 'Symbols (Trouble)',
			},
			{
				'<leader>vtl',
				'<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
				desc = 'LSP Definitions / references / ... (Trouble)',
			},
			{
				'<leader>vtL',
				'<cmd>Trouble loclist toggle<cr>',
				desc = 'Location List (Trouble)',
			},
			{
				'<leader>vtQ',
				'<cmd>Trouble qflist toggle<cr>',
				desc = 'Quickfix List (Trouble)',
			},
		},
		opts = {},
	},
}
