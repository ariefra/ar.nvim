return {
	{
		'https://github.com/echasnovski/mini.jump2d.git',
		dependencies = { 'https://github.com/echasnovski/mini.jump.git', 'https://github.com/echasnovski/mini.extra.git', 'https://github.com/echasnovski/mini.ai.git' },
		keys = {
			{
				'<leader>hl',
				'<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.line_start)<cr>',
				desc = 'Jump to line start',
			},
			{
				'<leader>hw',
				'<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<cr>',
				desc = 'Jump to word start',
			},
			{ '<leader>hq', '<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.query)<cr>', desc = 'Jump to user query' },
			{
				'<leader>hs',
				'<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<cr>',
				desc = 'Jump to line char',
			},
		},
		config = function()
			require('mini.jump2d').setup {}
			require('mini.jump').setup { delay = { highlight = 100, idle_stop = 7000 } }
			vim.cmd [[hi MiniJump gui=bold,italic]]
			local gen_ai_spec = require('mini.extra').gen_ai_spec
			require('mini.ai').setup {
				custom_textobjects = {
					B = gen_ai_spec.buffer(),
					D = gen_ai_spec.diagnostic(),
					I = gen_ai_spec.indent(),
					L = gen_ai_spec.line(),
					N = gen_ai_spec.number(),
				},
			}
		end,
	},
}
