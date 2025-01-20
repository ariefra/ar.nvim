return {
	'https://github.com/3rd/diagram.nvim',
	dependencies = { 'https://github.com/3rd/image.nvim' },
	opts = { -- you can just pass {}, defaults below
		renderer_options = {
			mermaid = {
				background = nil, -- nil | "transparent" | "white" | "#hex"
				theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
				scale = 1, -- nil | 1 (default) | 2  | 3 | ...
				width = nil, -- nil | 800 | 400 | ...
				height = nil, -- nil | 600 | 300 | ...
			},
			plantuml = {
				charset = nil,
			},
			d2 = {
				theme_id = nil,
				dark_theme_id = nil,
				scale = nil,
				layout = nil,
				sketch = nil,
			},
		},
	},
	config = function()
		require('diagram').setup {
			integrations = {
				require 'diagram.integrations.markdown',
				require 'diagram.integrations.neorg',
			},
			renderer_options = {
				mermaid = {
					theme = 'forest',
				},
				plantuml = {
					charset = 'utf-8',
				},
				d2 = {
					theme_id = 1,
				},
			},
		}
	end,
}
