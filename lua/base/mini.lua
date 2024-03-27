return {
	{ import = 'base.mini' },
	{
		'https://github.com/echasnovski/mini.fuzzy.git',
		--config = function() require('mini.fuzzy').setup {} end,
		opts = {},
		optional = true,
		lazy = true,
	},
	{
		'https://github.com/echasnovski/mini.visits.git',
		--config = function() require('mini.visits').setup {} end,
		opts = {},
		lazy = true,
	},
	{
		'https://github.com/echasnovski/mini.bufremove.git',
		optional = true,
		--config = function() require('mini.bufremove').setup {} end,
		opts = {},
		-- event = 'BufHidden',
	},
	{
		'https://github.com/echasnovski/mini.hipatterns.git',
		keys = {
			{ '<leader>cc', '<cmd>lua MiniHipatterns.toggle()<cr>', mode = 'n', desc = 'Mini Hipatterns' },
		},
		config = function()
			local hipatterns = require 'mini.hipatterns'
			hipatterns.setup {
				highlighters = {
					fixme = { pattern = 'FIXME|ERROR', group = 'MiniHipatternsFixme' },
					hack = { pattern = 'HACK', group = 'MiniHipatternsHack' },
					todo = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
					note = { pattern = 'NOTE', group = 'MiniHipatternsNote' },

					hex_color = hipatterns.gen_highlighter.hex_color {},
				},

				delay = {
					-- How much to wait for update after every text change
					text_change = 100,

					-- How much to wait for update after window scroll
					scroll = 100,
				},
			}
		end,
		event = 'BufReadPost',
	},
	{
		'https://github.com/echasnovski/mini.bracketed.git',
		--config = function() require('mini.bracketed').setup {} end,
		opts = {},
		event = 'BufReadPost',
	},
	{
		'https://github.com/echasnovski/mini.move.git',
		--config = function() require('mini.move').setup {} end,
		opts = {},
		event = 'ModeChanged *:v',
	},
	{
		'https://github.com/echasnovski/mini.pairs.git',
		--config = function() require('mini.pairs').setup {} end,
		opts = {},
		event = 'InsertEnter',
	},
	{
		'https://github.com/echasnovski/mini.surround.git',
		--config = function() require('mini.surround').setup {} end,
		opts = {},
		keys = function()
			local keys = {}
			for k, v in pairs {
				sa = 'add',
				sd = 'delete',
				sr = 'replace',
				sf = 'find previous',
				sF = 'find next',
				sh = 'highlight',
				sn = 'change number of line',
			} do
				table.insert(keys, { mode = 'v', k, desc = v .. ' surround' })
			end
			return keys
		end,
	},
	{
		'https://github.com/echasnovski/mini.sessions.git',
		--config = function() require('mini.sessions').setup {} end,
		opts = {},
		event = 'BufReadPost',
	},
	{
		'https://github.com/echasnovski/mini.splitjoin.git',
		--config = function() require('mini.splitjoin').setup {} end,
		opts = {},
		keys = { 'gS' },
	},
	{
		'https://github.com/echasnovski/mini.comment.git',
		--config = function() require('mini.comment').setup {} end,
		opts = {},
		keys = { { 'gcc', mode = 'n', desc = 'Mini Comment' }, { 'gc', mode = 'v', desc = 'Mini Comment' } },
	},
	{
		'https://github.com/echasnovski/mini.align.git',
		--config = function() require('mini.align').setup {} end,
		opts = {},
		keys = { { 'ga', mode = 'v', desc = 'Mini Align' }, { 'gA', mode = 'v', desc = 'Mini Align with Preview' } },
	},
	{
		'https://github.com/echasnovski/mini.misc.git',
		event = 'BufReadPost',
		config = function()
			require('mini.misc').setup {}
			require('mini.misc').setup_auto_root()
			require('mini.misc').setup_restore_cursor()
		end,
	},
	{
		'https://github.com/echasnovski/mini.base16.git',
		lazy = true,
		config = function()
			require('mini.base16').setup {
				palette = require('mini.base16').mini_palette('#000000', '#bbbbbb', 10),
				use_cterm = nil,
				plugins = {
					default = true,
				},
			}
		end,
		-- opts = {},
		-- event = 'ColorschemePre',
	},
	{
		-- 'https://github.com/echasnovski/mini.nvim.git',
		-- opts = {},
		-- config = function()
		-- 	require('mini.animate').setup {}
		-- 	require('mini.base16').setup {}
		-- 	require('mini.colors').setup {}
		-- 	require('mini.doc').setup {}
		-- 	require('mini.operators').setup {}
		-- 	require('mini.test').setup {}
		-- end,
	},
}
