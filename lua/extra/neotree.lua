return {
	{
		'https://github.com/nvim-neo-tree/neo-tree.nvim.git',
		keys = {
			-- { '<C-n>', '<cd>Neotree toggle<cr>', desc = 'NeoTree' },
			-- { '<C-h>', '<cmd>Neotree reveal_force_cwd<cr>', desc = 'NeoTree' },
			{ '<leader>e', '<cmd>Neotree focus<cr>', desc = 'NeoTree' },
		},
		cmd = 'Neotree',
		dependencies = {
			'https://github.com/MunifTanjim/nui.nvim',
		},
		config = function()
			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
			vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
			vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
			vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

			require('neo-tree').setup()
			-- vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
		end,
	},
}
