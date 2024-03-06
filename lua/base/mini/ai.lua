return {
	{
		'https://github.com/echasnovski/mini.ai.git',
		dependencies = { { 'https://github.com/echasnovski/mini.extra.git', lazy = true } },
		event = 'LspAttach',
		config = function()
			require('mini.extra').setup {}
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
