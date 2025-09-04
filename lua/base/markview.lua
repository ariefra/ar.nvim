return {
	{
		'https://github.com/OXY2DEV/markview.nvim',
		-- lazy = false, -- Recommended
		ft = 'markdown', -- If you decide to lazy-load anyway

		dependencies = {
			'https://github.com/echasnovski/mini.icons',
		},
		config = function()
			require('markview').setup({
				markdown = {
					list_items = {
						shift_width = 8,
						indent_size = function(buffer)
							if type(buffer) ~= "number" then
								return vim.bo.shiftwidth or 8;
							end
							return vim.bo[buffer].shiftwidth or 8;
						end,
					},
				},
			})
		end,
	},
}
