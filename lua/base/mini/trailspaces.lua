return {
	{
		'https://github.com/echasnovski/mini.trailspace',
		keys = {
			{ '<leader>d<space>', '<cmd>lua MiniTrailspace.trim()<cr>', desc = 'Trim Trailing Spaces' },
		},
		config = function() require('mini.trailspace').setup {} end,
	},
}
