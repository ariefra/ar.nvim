local map = vim.api.nvim_set_keymap
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
			{ '`', mode = 'n' },
			{ "'", mode = 'x' },
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
		config = function()
			local miniclue = require 'mini.clue'
			miniclue.setup {
				triggers = {
					-- Leader triggers
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },
					-- Built-in completion
					{ mode = 'i', keys = '<C-x>' },
					-- `g` key
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },
					-- `s` key
					{ mode = 'n', keys = 's' },
					{ mode = 'x', keys = 's' },
					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					{ mode = 'x', keys = "'" },
					{ mode = 'x', keys = '`' },
					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					{ mode = 'i', keys = '<C-r>' },
					{ mode = 'c', keys = '<C-r>' },
					-- Window commands
					{ mode = 'n', keys = '<C-w>' },
					-- `z` key
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },
					-- `\` key
					{ mode = 'n', keys = '\\' },
					{ mode = 'x', keys = '\\' },
					-- `[` key
					{ mode = 'n', keys = '[' },
					{ mode = 'x', keys = '[' },
					-- `]` key
					{ mode = 'n', keys = ']' },
					{ mode = 'x', keys = ']' },
				},
				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					-- miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
					{ mode = 'v', keys = 's', desc = '+Surround' },
					{ mode = 'n', keys = '<leader>c', desc = '+Format' },
					{ mode = 'n', keys = '<leader>d', desc = '+Delete' },
					{ mode = 'n', keys = '<leader>g', desc = '+Git' },
					{ mode = 'n', keys = '<leader>h', desc = '+Jump' },
					{ mode = 'n', keys = '<leader>m', desc = '+Map' },
					{ mode = 'n', keys = '<leader>t', desc = '+Pick' },
					{ mode = 'n', keys = '<leader>v', desc = '+Views' },
					{ mode = 'n', keys = '<leader>!', desc = '+Force' },
				},
				-- windows = {
				-- 	delay = 1,
				-- 	anchor = 'NE',
				-- 	border = 'single',
				-- 	focusable = false,
				-- 	relative = 'editor',
				-- 	style = 'minimal',
				-- 	width = 100,
				-- 	zindex = 99,
				-- },
			}
		end,
	},
}
