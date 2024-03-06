return {
	{
		'https://github.com/echasnovski/mini.basics',
		event = 'BufAdd',
		config = function()
			require('mini.basics').setup {
				options = { extra_ui = true, win_borders = 'solid' },
				mappings = { windows = true, move_with_alt = true },
				autocommands = { relnum_in_visual_mode = true },
			}
		end,
	},
}
