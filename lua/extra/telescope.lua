return {
	{
		'https://github.com/nvim-telescope/telescope.nvim.git',
		event = 'VeryLazy',
		cmd = 'Telescope',
		keys = {
			{ '<leader>t', '<cmd>Telescope<cr>', desc = 'Telescope' },
			-- { '<leader>to', '<cmd>Telescope oldfiles<cr>', desc = 'Recent Files' },
			-- { '<leader>tf', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
			-- { '<leader>tg', '<cmd>Telescope live_grep<cr>',  desc = 'Grep Files' },
			-- { '<F1>',       '<cmd>Telescope help_tags<cr>',  desc = 'Help Index' },
		},
		opts = {
			preview = true,
			border = false,
			vimgrep_arguments = {
				'rg',
				'--hidden',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				-- generic_sorter = require('mini.fuzzy').get_telescope_sorter,
			},
		},
		dependencies = {
			-- Telescope Extensions
			{ 'https://github.com/xiyaowong/telescope-emoji.nvim.git' },
			{ 'https://github.com/ghassan0/telescope-glyph.nvim.git' },
			{ 'https://github.com/nvim-telescope/telescope-fzf-native.nvim.git', build = { 'make' } },
			{
				'https://github.com/nvim-telescope/telescope-media-files.nvim.git',
				dependencies = { 'https://github.com/nvim-lua/popup.nvim.git' },
			},
			{ 'https://github.com/nvim-telescope/telescope-ui-select.nvim.git' },
		},
		config = function()
			require('telescope').load_extension 'ui-select'
			require('telescope').load_extension 'fzf'
			require('telescope').load_extension 'media_files'
			require('telescope').load_extension 'emoji'
			require('telescope').load_extension 'glyph'
		end,
	},
}
