return {
	{
		'https://gitlab.com/itaranto/preview.nvim',
		version = '*',
		cmd = { 'PreviewFile' },
		ft = { 'markdown', 'plantuml', 'groff' },
		opts = {
			previewers_by_ft = {
				markdown = {
					name = 'pandoc_wkhtmltopdf',
					renderer = { type = 'command', opts = { cmd = { 'xdg-open' } } },
				},
				plantuml = {
					name = 'plantuml_svg',
					renderer = { type = 'command', opts = { cmd = { 'xdg-open' } } },
				},
				groff = {
					name = 'groff_ms_pdf',
					renderer = { type = 'command', opts = { cmd = { 'xdg-open' } } },
				},
			},
			previewers = {
				plantuml_svg = {
					args = { '-pipe', '-tpng' },
				},
			},
			render_on_write = true,
		},
	},
}
