return {
	'DaikyXendo/nvim-material-icon',
	lazy = true,
	config = function()
		require('nvim-material-icon').setup {
			color_icons = true,
			default = true,
		}
		-- require('nvim-web-devicons').setup {
		-- 	override = require('nvim-material-icon').get_icons(),
		-- }
	end,
}
