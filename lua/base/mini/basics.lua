return {
	{
		'https://github.com/echasnovski/mini.basics',
		event = 'VeryLazy',
		config = function()
			require('mini.basics').setup {
				options = {
					basics = true,
					extra_ui = true,
					win_borders = 'solid',
				},
				mappings = {
					basic = true,
					option_toggle_prefix = [[\]],
					windows = true,
					move_with_alt = true,
				},
				autocommands = { relnum_in_visual_mode = true },
				silent = true,
			}
		end,
	},
}
