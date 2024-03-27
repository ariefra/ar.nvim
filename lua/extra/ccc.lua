return {
	{
		'https://github.com/uga-rosa/ccc.nvim.git',
		cmd = { 'CccPick', 'CccHighlighterToggle' },
		keys = { { '<leader>cc', '<cmd>CccHighlighterToggle<cr>', desc = 'Ccc' } },
		opts = { highlighter = { auto_enable = true, lsp = true } },
	},
}
