local masontools = { 'lua_ls', 'bashls' }
local lspserver = { 'lua-language-server', 'bash-language-server', 'rust-analyzer', 'clangd' }
local dap = {}
local linter = { 'selene', 'shellcheck' }
local formatter = { 'stylua' }

-- Diagnostic tooltip
-- vim.o.mouse = 'nvi'
-- vim.o.mousemoveevent = true
-- vim.keymap.set('n', '<MouseMove>', function()
--   local lsp_float_win = vim.b.lsp_floating_preview
--   if lsp_float_win and vim.api.nvim_win_is_valid(lsp_float_win) then vim.api.nvim_win_close(lsp_float_win, true) end
--   local mousepos = vim.fn.getmousepos()
--   if not mousepos or mousepos.line == 0 then return end
--   vim.diagnostic.open_float {
--     relative = 'mouse',
--     scope = 'cursor',
--     pos = { mousepos.line - 1, mousepos.column },
--   }
-- end, {})

vim.diagnostic.config {
	virtual_text = false,
}

return {
	{
		'https://github.com/williamboman/mason.nvim.git',
		cmd = { 'Mason', 'MasonUpdate', 'MasonInstall', 'MasonInstallAll' },
		build = { ':MasonUpdate' },
		keys = { { '<leader>vm', '<cmd>Mason<cr>', mode = '', desc = 'Mason' } },
		priority = 100,
		opts = {
			ensure_installed = vim.tbl_extend('keep', lspserver, formatter, linter, dap),
			ui = { width = 0.5, height = 0.5, keymaps = { toggle_help = '?m' } },
		},
		config = function(_, opts)
			require('mason').setup(opts)
			vim.api.nvim_create_user_command('MasonInstallAll', function()
				vim.cmd ':silent :MasonUpdate'
				vim.cmd(
					':silent :MasonInstall '
						.. table.concat(lspserver, ' ')
						.. ' '
						.. table.concat(formatter, ' ')
						.. ' '
						.. table.concat(linter, ' ')
						.. ' '
						.. table.concat(dap, ' ')
				)
				local mr = require 'mason-registry'
				mr:on('package:install:success', function()
					vim.defer_fn(function()
						-- trigger FileType event to possibly load this newly installed LSP server
						require('lazy.core.handler.event').trigger {
							event = 'FileType',
							buf = vim.api.nvim_get_current_buf(),
						}
					end, 100)
				end)

				local function ensure_installed()
					for _, tool in ipairs(opts.ensure_installed) do
						local p = mr.get_package(tool)
						if not p:is_installed() then p:install() end
					end
				end

				if mr.refresh then
					mr.refresh(ensure_installed)
				else
					ensure_installed()
				end
			end, {})
		end,
	},
	{
		'https://github.com/williamboman/mason-lspconfig.nvim.git',
		event = 'BufReadPost',
		build = { ':MasonInstallAll' },
		dependencies = {
			'https://github.com/williamboman/mason.nvim.git',
			'https://github.com/neovim/nvim-lspconfig.git',
		},
		config = function()
			local lspcfg = require 'lspconfig'
			-- local capabilities = vim.fn.extend(require('cmp_nvim_lsp').default_capabilities(), vim.lsp.protocol.make_client_capabilities())
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

			local handlers = {
				function(server_name) -- default handler (optional)
					require('lspconfig')[server_name].setup {
						capabilities = capabilities,
					}
				end,
				['lua_ls'] = function()
					lspcfg.lua_ls.setup {
						settings = {
							Lua = {
								runtime = { version = 'LuaJIT' },
								completion = {
									callSnippet = 'both',
									keywordSnippet = 'both',
									displayContext = 5,
								},
								diagnostics = {
									disable = { 'lowercase-global' },
									globals = { 'vim' },
								},
							},
						},
					}
				end,
			}
			require('mason').setup()
			require('mason-lspconfig').setup {
				ensure_installed = masontools,
				handlers = handlers,
			}
		end,
	},
	{
		'https://github.com/stevearc/conform.nvim.git',
		event = 'LspAttach',
		cmd = { 'ConformInfo' },
    -- stylua: ignore
    keys = {
      { '<leader>cf', function() require('conform').format { async = true, lsp_fallback = true } end, mode = '', desc = 'Format buffer', },
    },
		opts = {
			formatters_by_ft = {
				lua = formatter,
				json = formatter,
				html = formatter,
				javascript = formatter,
				md = formatter,
				sh = formatter,
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
}
