-- print 'treesitter loaded'
local treesitter = { 'lua', 'bash' }
return {
	-- treesitter
	{
		'https://github.com/nvim-treesitter/nvim-treesitter.git',
		event = 'VeryLazy',
		cmd = { 'TSUpdateSync', 'TSInstallSync', 'TSModuleInfo' },
		-- keys = { 'gnn', 'grn', 'grc', 'grm' }, -- incremental selection
		build = { ':silent :TSUpdateSync ' .. table.concat(treesitter, ' ') },
	},
}
