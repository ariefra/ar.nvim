return {
	{
		'https://github.com/hrsh7th/nvim-cmp.git',
		event = { 'LspAttach', 'InsertEnter' },
		dependencies = {
			{ 'https://github.com/hrsh7th/cmp-nvim-lsp.git', lazy = true },
			{ 'https://github.com/hrsh7th/cmp-buffer.git', lazy = true },
			{ 'https://github.com/hrsh7th/cmp-path.git', lazy = true },
			{ 'https://github.com/Exafunction/codeium.nvim.git', lazy = true, optional = true },
			{ 'https://github.com/hrsh7th/cmp-emoji.git', lazy = true },
			{ 'https://github.com/hrsh7th/cmp-nvim-lua.git', lazy = true },
			{ 'https://github.com/saadparwaiz1/cmp_luasnip.git' },
			{ 'https://github.com/petertriho/cmp-git' },
		},
		opts = function()
			vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
			local cmp = require 'cmp'
			local defaults = require 'cmp.config.default'()
			return {
				sources = cmp.config.sources {
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua' },
					{ name = 'path' },
					{ name = 'emoji' },
					{ name = 'buffer' },
					{ name = 'luasnip' },
				},
				completion = {
					completeopt = 'menu,menuone,preview,longest',
				},
				-- enabled = function()
				-- 	-- disable completion if the cursor is `Comment` syntax group.
				-- 	return not cmp.config.context.in_syntax_group 'Comment'
				-- end,
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				mapping = cmp.mapping.preset.insert {
					['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
					['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					['<S-CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					['<C-CR>'] = function(fallback)
						cmp.abort()
						fallback()
					end,
				},
				formatting = {
					-- format = function(_, item)
					--   local icons = require("lazyvim.config").icons.kinds
					--   if icons[item.kind] then
					--     item.kind = icons[item.kind] .. item.kind
					--   end
					--   return item
					-- end,
				},
				experimental = {
					ghost_text = {
						hl_group = 'CmpGhostText',
					},
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sorting = defaults.sorting,
				view = {
					docs = {
						auto_open = true,
					},
				},
			}
		end,

		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			local cmp = require 'cmp'
			cmp.setup(opts)

			-- `/` cmdline setup.
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				},
			})

			-- `:` cmdline setup.
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
				}, {
					{ name = 'cmdline' },
				}),
			})
		end,
	},
}
