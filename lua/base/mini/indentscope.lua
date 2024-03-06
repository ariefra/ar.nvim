return {
	{
		'https://github.com/echasnovski/mini.indentscope',
		event = 'BufReadPost',
		config = function()
			require('mini.indentscope').setup {
				draw = {
					delay = 250,
					animation = require('mini.indentscope').gen_animation.quartic(), -- { easing = 'out', duration = 10, unit = 'step', },
				},
				symbol = '│',
			}
			vim.cmd [[ hi MiniIndentscopeSymbol ctermfg=NONE ctermbg=NONE guifg='#444444' guibg=NONE ]]
		end,
	},
}
