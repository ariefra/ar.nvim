-- local map = vim.api.nvim_set_keymap
return {
	{
		'https://github.com/echasnovski/mini.clue',
		-- event = 'VimEnter',
		keys = {
			{ '<Leader>', mode = 'n' },
			{ '<Leader>', mode = 'x' },
			-- Built-in completion
			{ '<C-x>', mode = 'i' },
			-- `g` key
			{ 'g', mode = 'n' },
			{ 'g', mode = 'x' },
			-- `s` key
			{ 's', mode = 'n' },
			{ 's', mode = 'x' },
			-- Marks
			{ "'", mode = 'n' },
			{ "'", mode = 'x' },
			{ '`', mode = 'n' },
			{ '`', mode = 'x' },
			-- Registers
			{ '"', mode = 'n' },
			{ '"', mode = 'x' },
			{ '<C-r>', mode = 'i' },
			{ '<C-r>', mode = 'c' },
			-- Window commands
			{ '<C-w>', mode = 'n' },
			-- `z` key
			{ 'z', mode = 'n' },
			{ 'z', mode = 'x' },
			-- `\` key
			{ '\\', mode = 'n' },
			{ '\\', mode = 'x' },
			-- `[` key
			{ '[', mode = 'n' },
			{ '[', mode = 'x' },
			-- `]` key
			{ ']', mode = 'n' },
			{ ']', mode = 'x' },
		},
		opts = {},
		config = function()
			local miniclue = require 'mini.clue'
			miniclue.setup {
				triggers = {
					-- Leader triggers
					{ keys = '<Leader>', mode = 'n' },
					{ keys = '<Leader>', mode = 'x' },
					-- Built-in completion
					{ keys = '<C-x>', mode = 'i' },
					-- `g` key
					{ keys = 'g', mode = 'n' },
					{ keys = 'g', mode = 'x' },
					-- `s` key
					{ keys = 's', mode = 'n' },
					{ keys = 's', mode = 'x' },
					-- Marks
					{ keys = "'", mode = 'n' },
					{ keys = "'", mode = 'x' },
					{ keys = '`', mode = 'n' },
					{ keys = '`', mode = 'x' },
					-- Registers
					{ keys = '"', mode = 'n' },
					{ keys = '"', mode = 'x' },
					{ keys = '<C-r>', mode = 'i' },
					{ keys = '<C-r>', mode = 'c' },
					-- Window commands
					{ keys = '<C-w>', mode = 'n' },
					-- `z` key
					{ keys = 'z', mode = 'n' },
					{ keys = 'z', mode = 'x' },
					-- `\` key
					{ keys = '\\', mode = 'n' },
					{ keys = '\\', mode = 'x' },
					-- `[` key
					{ keys = '[', mode = 'n' },
					{ keys = '[', mode = 'x' },
					-- `]` key
					{ keys = ']', mode = 'n' },
					{ keys = ']', mode = 'x' },
				},
				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					-- miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
					{ keys = 's', mode = 'v', desc = '+Surround' },
					{ keys = '<leader>c', mode = 'n', desc = '+Format' },
					{ keys = '<leader>d', mode = 'n', desc = '+Delete' },
					{ keys = '<leader>g', mode = 'n', desc = '+Git' },
					{ keys = '<leader>h', mode = 'n', desc = '+Jump' },
					{ keys = '<leader>m', mode = 'n', desc = '+Map' },
					{ keys = '<leader>t', mode = 'n', desc = '+Pick' },
					{ keys = '<leader>v', mode = 'n', desc = '+Views' },
					{ keys = '<leader>!', mode = 'n', desc = '+Force' },
				},
				windows = {
					-- delay = 1,
					-- anchor = 'NE',
					-- border = 'solid',
					-- focusable = false,
					-- relative = 'editor',
					-- style = 'minimal',
					-- width = 100,
					-- zindex = 99,
				},
			}
		end,
	},
}
