return {
	{
		'https://github.com/nvim-neo-tree/neo-tree.nvim.git',
		keys = {
			{ '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
		},
		cmd = 'Neotree',
		dependencies = {
			'https://github.com/MunifTanjim/nui.nvim.git',
			'https://github.com/nvim-tree/nvim-web-devicons.git',
		},
		config = function()
			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
			vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
			vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
			vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })
			require('neo-tree').setup {
				source_selector = {
					-- winbar = true, -- toggle to show selector on winbar
					statusline = true, -- toggle to show selector on statusline
					show_scrolled_off_parent_node = false, -- boolean
					sources = { -- table
						{
							source = 'filesystem', -- string
							display_name = ' 󰉓 Files ', -- string | nil
						},
						{
							source = 'buffers', -- string
							display_name = ' 󰈚 Buffers ', -- string | nil
						},
						{
							source = 'git_status', -- string
							display_name = ' 󰊢 Git ', -- string | nil
						},
					},
					content_layout = 'start', -- string
					tabs_layout = 'equal', -- string
					truncation_character = '…', -- string
					tabs_min_width = nil, -- int | nil
					tabs_max_width = nil, -- int | nil
					padding = 0, -- int | { left: int, right: int }
					separator = { left = '▏', right = '▕' }, -- string | { left: string, right: string, override: string | nil }
					separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
					show_separator_on_edge = false, -- boolean
					highlight_tab = 'NeoTreeTabInactive', -- string
					highlight_tab_active = 'NeoTreeTabActive', -- string
					highlight_background = 'NeoTreeTabInactive', -- string
					highlight_separator = 'NeoTreeTabSeparatorInactive', -- string
					highlight_separator_active = 'NeoTreeTabSeparatorActive', -- string
				},

				filesystem = {
					bind_to_cwd = true,
					cwd_target = {
						sidebar = 'tab', -- sidebar is when position = left or right
						current = 'window', -- current is when position = current
					},

					filtered_items = {
						always_show = { '.config' },
						hide_gitignored = false,
					},
				},
			}
			-- vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
		end,
	},
}
