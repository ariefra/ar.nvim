-- print 'lsp loaded'
local lspserver = { 'lua_ls', 'ast_grep', 'biome' }
local dap = {}
local linter = { 'selene', 'biome', 'ast_grep' }
local formatter = { 'stylua', 'ast_grep', 'biome' }
return {
	-- language server
	{
		'https://github.com/neovim/nvim-lspconfig.git',
		-- event = 'BufReadPre',
		event = 'FileType',
		dependencies = {
			{ 'https://github.com/williamboman/mason.nvim.git', build = { '<cmd>MasonUpdate<cr>' } },
			{
				'https://github.com/williamboman/mason-lspconfig.nvim.git',
				cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll' },
				config = function()
					require('mason').setup()
					vim.api.nvim_create_user_command('MasonInstallAll', function()
						vim.cmd(':silent :MasonInstall ' .. table.concat(vim.tbl_extend('keep', formatter, linter, dap), ' '))
					end, {})
					require('mason-lspconfig').setup {
						ensure_installed = lspserver,
						automatic_installation = true,
						automatic_setup = true,
					}
					-- Set up lspconfig completion
					-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
					require('mason-lspconfig').setup_handlers {
						function(server_name) -- default handler (optional)
							require('lspconfig')[server_name].setup {}
							-- capabilities = capabilities
						end,
						['lua_ls'] = function()
							local lspconfig = require 'lspconfig'
							lspconfig.lua_ls.setup {
								settings = { Lua = { diagnostics = { globals = { 'vim' } }, workspace = { preloadFileSize = 6000 } } },
							}
						end,
					}
				end,
			},
		},
	},

	-- formatters
	{
		'https://github.com/stevearc/conform.nvim.git',
		event = 'FileType',
		cmd = { 'ConformInfo' },
    -- stylua: ignore
    keys = {
      { '<leader>cf', function() require('conform').format { async = true, lsp_fallback = true } end, mode = '', desc = 'Format buffer', },
    },
		opts = {
			formatters_by_ft = {
				lua = { 'stylua', 'ast_grep' },
				json = { 'biome' },
				html = { 'biome', 'ast_grep' },
				javascript = { 'biome', 'ast_grep' },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			-- formatters = { stylua = {} },
		},
		-- init = function()
		-- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		-- end,
	},
}
