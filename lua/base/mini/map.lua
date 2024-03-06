return {
	{
		'https://github.com/echasnovski/mini.map',
		keys = {
			{ '<Leader>mc', '<cmd>lua MiniMap.close()<cr>', desc = 'Close Map' },
			{ '<Leader>mf', '<cmd>lua MiniMap.toggle_focus()<cr>',desc = 'Focus Map Toggle' },
			{ '<Leader>mo', '<cmd>lua MiniMap.open()<cr>', desc ='Open Map' },
			{ '<Leader>mr', '<cmd>lua MiniMap.refresh()<cr>', desc = 'Refresh Map' },
			{ '<Leader>ms', '<cmd>lua MiniMap.toggle_side()<cr>', desc = 'Toggle Map Side' },
			{ '<Leader>mt', '<cmd>lua MiniMap.toggle()<cr>',desc = 'Toggle Map' },
		},
		config = function() require('mini.map').setup {} end,
	},
}
