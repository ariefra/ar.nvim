return {
	{
		'https://github.com/echasnovski/mini.pick.git',
		keys = {
			{ '<F1>', '<cmd>Pick help<cr>', desc = 'Help Index' },
			{ '<F2>', '<cmd>Pick oldfiles<cr>', desc = 'Recent Files' },
			{ '<F3>', '<cmd>Pick files<cr>', desc = 'Find Files' },
			{ '<F5>', '<cmd>Pick buffers<cr>', desc = 'Buffers' },
			{ '<F6>', '<cmd>Pick grep_live<cr>', desc = 'Grep Live' },
			{ '<F7>', '<cmd>Pick grep<cr>', desc = 'Grep Pattern' },
			{ '<F8>', '<cmd>Pick explorer<cr>', desc = 'Explorer' },

			{ '<leader>tb', '<cmd>Pick buffers<cr>', desc = 'Buffers' },
			{ '<leader>te', '<cmd>Pick explorer<cr>', desc = 'Explorer' },
			{ '<leader>tf', '<cmd>Pick files<cr>', desc = 'Find Files' },
			{ '<leader>to', '<cmd>Pick oldfiles<cr>', desc = 'Recent Files' },
			{ '<leader>td', '<cmd>Pick diagnostic<cr>', desc = 'Diagnostic' },
			{ '<leader>tk', '<cmd>Pick keymaps<cr>', desc = 'Keymaps' },

			{ '<leader>trp', '<cmd>Pick grep<cr>', desc = 'Grep Pattern' },
			{ '<leader>trl', '<cmd>Pick grep_live<cr>', desc = 'Grep Live' },

			{ '<leader>thl', '<cmd>Pick hipatterns<cr>', desc = 'Highlight Patterns' },
			{ '<leader>thg', '<cmd>Pick hl_groups<cr>', desc = 'Highlight Groups' },
			{ '<leader>thi', '<cmd>Pick history<cr>', desc = 'History' },

			{ '<leader>tgb', '<cmd>Pick git_branches<cr>', desc = 'Git Branches' },
			{ '<leader>tgc', '<cmd>Pick git_commits<cr>', desc = 'Git Commits' },
			{ '<leader>tgf', '<cmd>Pick git_files<cr>', desc = 'Git Files' },
			{ '<leader>tgh', '<cmd>Pick git_hunks<cr>', desc = 'Git Hunks' },

			{ '<leader>tlq', '<cmd>Pick list scope="quickfix"<cr>', desc = 'list quickfix' },
			{ '<leader>tll', '<cmd>Pick list scope="location"<cr>', desc = 'list locations' },
			{ '<leader>tlj', '<cmd>Pick list scope="jump"<cr>', desc = 'list jump' },
			{ '<leader>tlc', '<cmd>Pick list scope="change"<cr>', desc = 'list change' },

			{ '<leader>tlh', '<cmd>Pick lsp scope="declaration"<cr>', desc = 'lsp declaration' },
			{ '<leader>tlf', '<cmd>Pick lsp scope="definition"<cr>', desc = 'lsp definition' },
			{ '<leader>tld', '<cmd>Pick lsp scope="document_symbol"<cr>', desc = 'lsp doc_sym' },
			{ '<leader>tli', '<cmd>Pick lsp scope="implementation"<cr>', desc = 'lsp implementation' },
			{ '<leader>tlr', '<cmd>Pick lsp scope="references"<cr>', desc = 'lsp references workspace_sym' },
			{ '<leader>tlt', '<cmd>Pick lsp scope="type_definition"<cr>', desc = 'lsp type_def' },
			{ '<leader>tlw', '<cmd>Pick lsp scope="workspace_symbol"<cr>', desc = 'lsp workspace_sym' },
		},
		cmd = { 'Pick' },
		dependencies = {
			'https://github.com/echasnovski/mini.extra.git',
			'https://github.com/echasnovski/mini.icons.git',
		},
		opts = {},
		config = function()
			local win_config = function()
				local height = math.floor(0.4 * vim.o.lines)
				local width = math.floor(0.7 * vim.o.columns)
				return {
					anchor = 'NW',
					height = height,
					width = width,
					row = math.floor(0.5 * (vim.o.lines - height)),
					col = math.floor(0.5 * (vim.o.columns - width)),
					-- border = 'none',
				}
			end
			require('mini.extra').setup {}
			require('mini.pick').setup {
				options = { use_cache = true },
				window = { config = win_config },
			}
			-- overide vim.ui.select
			vim.ui.select = function(items, opts, on_choice) require('mini.pick').ui_select(items, opts, on_choice) end
		end,
	},
}
