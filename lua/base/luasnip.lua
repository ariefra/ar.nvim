return {
	{
		'https://github.com/L3MON4D3/LuaSnip.git',
		event = { 'LspAttach', 'InsertEnter' },
		lazy = true,
		build = (not jit.os:find 'Windows')
				and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
			or nil,
		dependencies = {
			{
				'https://github.com/rafamadriz/friendly-snippets.git',
				lazy = true,
				config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
			},
			{
				'https://github.com/hrsh7th/nvim-cmp.git',
				lazy = true,
				dependencies = {
					'https://github.com/saadparwaiz1/cmp_luasnip.git',
				},
				opts = function(_, opts)
					opts.snippet = {
						expand = function(args) require('luasnip').lsp_expand(args.body) end,
					}
					table.insert(opts.sources, { name = 'luasnip' })
				end,
			},
		},
		opts = {
			history = true,
			delete_check_events = 'TextChanged',
		},
		-- stylua: ignore
		-- keys = {
		--   {
		--     "<tab>",
		--     function()
		--       return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
		--     end,
		--     expr = true,
		--     silent = true,
		--     mode = "i",
		--   },
		--   { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
		--   { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
		-- },
	},
}
