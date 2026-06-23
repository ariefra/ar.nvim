return {
	-- add blink.compat
	{
		'saghen/blink.compat',
		-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},

	{
		'saghen/blink.cmp',
		lazy = true,
		event = 'LSPAttach',
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = 'super-tab',
		},
		dependencies = {
			{ 'https://github.com/hrsh7th/cmp-nvim-lsp.git', lazy = true },
			{ 'https://github.com/hrsh7th/cmp-buffer.git', lazy = true },
			{ 'https://github.com/hrsh7th/cmp-path.git', lazy = true },
			{ 'https://github.com/hrsh7th/cmp-cmdline.git', lazy = true },
			{ 'https://github.com/hrsh7th/cmp-emoji.git', lazy = true },
			{ 'https://github.com/hrsh7th/cmp-nvim-lua.git', lazy = true },
			{ 'https://github.com/lukas-reineke/cmp-rg', lazy = true },
			{ 'https://github.com/quangnguyen30192/cmp-nvim-ultisnips', lazy = true },
			{ 'https://github.com/Exafunction/codeium.nvim.git', lazy = true, optional = true },
			{ 'https://github.com/saadparwaiz1/cmp_luasnip.git', lazy = true },
			{ 'https://github.com/petertriho/cmp-git', lazy = true },
			{ 'https://github.com/echasnovski/mini.snippets', lazy = true },
			-- add source
			{ 'dmitmel/cmp-digraphs', lazy = true },
		},
		-- Enables keymaps, completions and signature help when true (doesn't apply to cmdline or term)
		--
		-- If the function returns 'force', the default conditions for disabling the plugin will be ignored
		-- Default conditions: (vim.bo.buftype ~= 'prompt' and vim.b.completion ~= false)
		-- Note that the default conditions are ignored when `vim.b.completion` is explicitly set to `true`
		--
		-- Exceptions: vim.bo.filetype == 'dap-repl'
		enabled = function() return not vim.tbl_contains({ 'lua', 'markdown' }, vim.bo.filetype) end,

		-- Disable cmdline
		-- cmdline = { enabled = false },

		fuzzy = { implementation = 'prefer_rust_with_warning' },
		completion = {
			-- 'prefix' will fuzzy match on the text before the cursor
			-- 'full' will fuzzy match on the text before _and_ after the cursor
			-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
			keyword = { range = 'full' },

			-- Disable auto brackets
			-- NOTE: some LSPs may add auto brackets themselves anyway
			-- accept = { auto_brackets = { enabled = false } },

			-- Don't select by default, auto insert on selection
			-- list = { selection = { preselect = false, auto_insert = true } },
			list = { selection = { preselect = true, auto_insert = true } },
			-- or set via a function
			-- list = { selection = { preselect = function(ctx) return vim.bo.filetype ~= 'markdown' end } },

			menu = {
				-- Don't automatically show the completion menu
				-- auto_show = false,
				auto_show = true,
				auto_show_delay_ms = 200,

				-- nvim-cmp style menu
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
								return kind_icon
							end,
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
								return hl
							end,
						},
						kind = {
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
								return hl
							end,
						},
					},
					padding = { 0, 1 }, -- padding only on right side
					columns = {
						{ 'label', 'label_description', gap = 1 },
						{ 'kind_icon', 'kind' },
					},
				},
			},

			-- Show documentation when selecting a completion item
			documentation = { auto_show = true, auto_show_delay_ms = 500 },

			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = true, show_with_menu = false },
		},

		sources = {
			-- remember to enable your providers here
			default = { 'lsp', 'path', 'snippets', 'buffer', 'digraphs' },
			providers = {
				lsp = { fallbacks = {} },
				-- create provider
				digraphs = {
					-- IMPORTANT: use the same name as you would for nvim-cmp
					name = 'digraphs',
					module = 'blink.compat.source',

					-- all blink.cmp source config options work as normal:
					score_offset = -3,

					-- this table is passed directly to the proxied completion source
					-- as the `option` field in nvim-cmp's source config
					--
					-- this is NOT the same as the opts in a plugin's lazy.nvim spec
					opts = {
						-- this is an option from cmp-digraphs
						cache_digraphs_on_start = true,

						-- If you'd like to use a `name` that does not exactly match nvim-cmp,
						-- set `cmp_name` to the name you would use for nvim-cmp, for instance:
						-- cmp_name = "digraphs"
						-- then, you can set the source's `name` to whatever you like.
					},
				},
			},
		},
		-- Use a preset for snippets, check the snippets documentation for more information
		-- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' },
		snippets = { preset = 'mini_snippets' },

		-- Experimental signature help support
		signature = { enabled = true },
	},
}
