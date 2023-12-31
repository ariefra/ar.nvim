-- print 'treesitter loaded'
local treesitter = { 'lua', 'bash' }
return {
	-- treesitter
	{
		'https://github.com/nvim-treesitter/nvim-treesitter.git',
		event = 'FileType',
		cmd = { 'TSUpdateSync', 'TSInstallSync', 'TSModuleInfo' },
		-- keys = { 'gnn', 'grn', 'grc', 'grm' }, -- incremental selection
		build = { ':silent :TSUpdateSync ' .. table.concat(treesitter, ' ') },
	},
}
