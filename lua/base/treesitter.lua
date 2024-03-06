local treesitter = { 'lua' }
return {
	{
		'https://github.com/nvim-treesitter/nvim-treesitter.git',
		event = 'LspAttach',
		cmd = { 'TSUpdateSync', 'TSInstallSync', 'TSModuleInfo', 'TSConfigInfo' },
		-- keys = { 'gnn', 'grn', 'grc', 'grm' }, -- incremental selection
		build = { ':silent :TSUpdateSync ' .. table.concat(treesitter, ' ') },
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = vim.fn.deepcopy(treesitter),
				-- Automatically install missing parsers when entering buffer
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			}
		end,
	},
}
