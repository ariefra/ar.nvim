return {
	{
		'https://github.com/yetone/avante.nvim',
		event = 'LspAttach',
		build = 'make', -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
		opts = {
			-- -- add any opts here
			-- {
			-- 	---@alias Provider "openai" | "claude" | "azure"  | "copilot" | [string]
			-- 	-- provider = 'claude',
			-- 	-- claude = {
			-- 	-- 	endpoint = 'https://api.anthropic.com',
			-- 	-- 	model = 'claude-3-5-sonnet-20240620',
			-- 	-- 	temperature = 0,
			-- 	-- 	max_tokens = 4096,
			-- 	-- },
			provider = 'openai',
			openai = {
				endpoint = 'https://api.openai.com/v1/assistants',
				model = 'gpt-3.5',
				timeout = 30000, -- Timeout in milliseconds
				temperature = 0,
				max_tokens = 4096,
				['local'] = false,
			},
			-- 	mappings = {
			-- 		ask = '<leader>aa',
			-- 		edit = '<leader>ae',
			-- 		refresh = '<leader>ar',
			-- 		--- @class AvanteConflictMappings
			-- 		diff = {
			-- 			ours = 'co',
			-- 			theirs = 'ct',
			-- 			none = 'c0',
			-- 			both = 'cb',
			-- 			next = ']x',
			-- 			prev = '[x',
			-- 		},
			-- 		jump = {
			-- 			next = ']]',
			-- 			prev = '[[',
			-- 		},
			-- 		submit = {
			-- 			normal = '<CR>',
			-- 			insert = '<C-s>',
			-- 		},
			-- 		toggle = {
			-- 			debug = '<leader>ad',
			-- 			hint = '<leader>ah',
			-- 		},
			-- 	},
			-- 	hints = { enabled = true },
			-- 	windows = {
			-- 		wrap = true, -- similar to vim.o.wrap
			-- 		width = 30, -- default % based on available width
			-- 		sidebar_header = {
			-- 			align = 'center', -- left, center, right for title
			-- 			rounded = true,
			-- 		},
			-- 	},
			-- 	highlights = {
			-- 		---@type AvanteConflictHighlights
			-- 		diff = {
			-- 			current = 'DiffText',
			-- 			incoming = 'DiffAdd',
			-- 		},
			-- 	},
			-- 	--- @class AvanteConflictUserConfig
			-- 	diff = {
			-- 		debug = false,
			-- 		autojump = true,
			-- 		---@type string | fun(): any
			-- 		list_opener = 'copen',
			-- 	},
			-- },
		},
		dependencies = {
			'https://github.com/echasnovski/mini.icons',
			'https://github.com/stevearc/dressing.nvim',
			'https://github.com/nvim-lua/plenary.nvim',
			'https://github.com/MunifTanjim/nui.nvim',
			--- The below is optional, make sure to setup it properly if you have lazy=true
			{
				'https://github.com/MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { 'markdown', 'Avante' },
				},
				ft = { 'markdown', 'Avante' },
			},
		},
	},
}
