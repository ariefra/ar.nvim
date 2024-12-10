return {
	{
		'https://github.com/echasnovski/mini.starter.git',
		-- event = 'VimEnter',
		keys = {
			{ '<F4>', '<cmd>lua MiniStarter.open()<cr>', desc = 'Dashboard' },
		},
		dependencies = { 'https://github.com/echasnovski/mini.pick.git', 'https://github.com/echasnovski/mini.visits.git' },
		config = function()
			local starter = require 'mini.starter'
			starter.setup {
				-- autoopen = true,
				evaluate_single = true,
				-- header = '\t\t\t\t...the mini you become, the more you can make',
				-- footer = '<cr>\tto select\n<c-c>\tto cancel\n<f4>\tshow again this dialog\n<sp>\tfor leader\n<\\>\t\tfor toggles\n<[>\t\tfor bracketed',
				items = {
					{ name = 'Starter close', action = 'lua require("mini.starter").close()', section = 'Builtin actions' },
					starter.sections.builtin_actions(),
					{ name = 'Profile Startup', action = 'Lazy profile', section = 'Builtin actions' },
					{ name = 'Update Plugins', action = 'Lazy update', section = 'Builtin actions' },
					{ name = 'MasonInstallAll', action = 'MasonInstallAll', section = 'Builtin actions' },
					starter.sections.recent_files(9, true),
					-- { name = 'Git commits', action = 'Pick git_commits', section = 'Pick' },
					-- { name = 'Options', action = 'Pick options', section = 'Pick' },
					-- { name = 'Keymaps', action = 'Pick keymaps', section = 'Pick' },
					-- { name = 'Registers', action = 'Pick registers', section = 'Pick' },
					starter.sections.pick(),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.indexing('all', { 'Builtin actions', 'Pick' }),
					starter.gen_hook.aligning('left', 'center'),
					starter.gen_hook.padding(25, 0),
				},
			}
			-- vim.api.nvim_create_autocmd('User', {
			-- 	pattern = 'LazyVimStarted',
			-- 	callback = function()
			-- 		local stats = require('lazy').stats()
			-- 		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			-- 		-- local pad_footer = string.rep(' ', 8)
			-- 		-- starter.config.header = (starter.config.header or '')
			-- 		starter.config.footer = (starter.config.footer or '')
			-- 			.. 'neovim loaded '
			-- 			.. stats.loaded
			-- 			.. '/'
			-- 			.. stats.count
			-- 			.. ' plugins in '
			-- 			.. ms
			-- 			.. 'ms'
			-- 		if vim.g.ministarter_autoopen then
			-- 		pcall(starter.refresh)
			-- 		else
			-- 			vim.notify(
			-- 				'' .. 'neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms',
			-- 				vim.log.levels.INFO
			-- 			)
			-- 		end
			-- 	end,
			-- })
		end,
	},
}
