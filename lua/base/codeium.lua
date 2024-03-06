return {

	{
		'https://github.com/hrsh7th/nvim-cmp.git',
		dependencies = {
			-- codeium
			{
				'https://github.com/Exafunction/codeium.nvim.git',
				cmd = 'Codeium',
				build = ':Codeium Auth',
				opts = {},
        dependencies = {	{ 'https://github.com/nvim-lua/plenary.nvim.git', lazy = true, },},
			},
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			table.insert(opts.sources, 1, {
				name = 'codeium',
				group_index = 1,
				priority = 100,
			})
		end,
	},
	-- -- codeium
	-- {
	-- 	'https://github.com/Exafunction/codeium.nvim.git',
	-- 	event = 'InsertEnter',
	-- 	cmd = { 'Codeium' },
	-- 	config = function()
	-- 		vim.keymap.set('i', '<tab>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
	-- 		-- 	-- vim.keymap.set('i', '<tab>', '<cmd>call codeium#Accept()<cr>', { desc = 'Codeium Accept' })
	-- 		-- 	-- vim.keymap.set('i', '<tab>', '<plug>(codeium-Accept)', { expr = true, silent = true })
	-- 		-- 	-- vim.keymap.set('i', '<tab>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
	-- 	end,
	-- },
}
