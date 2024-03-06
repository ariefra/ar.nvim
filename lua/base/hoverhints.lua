return {
	{
		'https://github.com/soulis-1256/hoverhints.nvim.git',
		event = 'LspAttach',
		config = function() require('eagle').setup {} end,
	},
}
