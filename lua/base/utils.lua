return {
	-- commons
	{ 'https://github.com/nvim-lua/plenary.nvim.git', event = 'VeryLazy' },
	{
		'https://github.com/nvim-tree/nvim-web-devicons',
		event = 'VeryLazy',
		config = function()
			local fg = vim.fn.synIDattr(vim.fn.hlID 'NormalNC', 'fg', 'guifg') --- '#cbcb41'
			require('nvim-web-devicons').setup {
				override_by_filename = {
					['.gitattributes'] = { icon = '', color = fg },
					['.gitignore'] = { icon = '', color = fg },
					['commit_editmsg'] = { icon = '', color = fg },
					['gitconfig'] = { icon = '', color = fg },
				},
			}
		end,
	},
}
