return {
	{
		'https://github.com/echasnovski/mini.tabline',
		event = 'BufAdd',
		-- keys = {
		-- 	{ '<tab>', '<cmd>bnext<cr>', desc = 'Next Buffer' },
		-- 	{ '<s-tab>', '<cmd>bprev<cr>', desc = 'Prev Buffer' },
		-- 	{ '<c-tab>', '<cmd>tabnext<cr>', desc = 'Next Tab' },
		-- 	{ '<c-s-tab>', '<cmd>tabprev<cr>', desc = 'Prev Tab' },
		-- },
		opts = {
			-- Whether to show file icons (requires 'nvim-tree/nvim-web-devicons')
			show_icons = true,

			-- Whether to set Vim's settings for tabline (make it always shown and
			-- allow hidden buffers)
			-- set_vim_settings = true,

			-- Where to show tabpage section in case of multiple vim tabpages.
			-- One of 'left', 'right', 'none'.
			tabpage_section = 'right',
		},
	},
}
