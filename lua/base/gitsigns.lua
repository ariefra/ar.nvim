return {
	{
		'https://github.com/lewis6991/gitsigns.nvim.git',
		opts = {},
		event = 'BufReadPost',
		config = function()
			require('gitsigns').setup {
				signs = {
					add = { text = '++' },
					change = { text = '│' },
					delete = { text = '--' },
					topdelete = { text = '-‾' },
					changedelete = { text = '~' },
					untracked = { text = '.' },
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
				-- show_deleted = true,
				watch_gitdir = {
					follow_files = true,
				},
				diff_opts = {
					algorithm = 'minimal',
					ignore_whitespace = true,
					ignore_blank_lines = true,
				},
				attach_to_untracked = true,
				current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
					delay = 300,
					ignore_whitespace = true,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = 'none',
					style = 'minimal',
					relative = 'cursor',
					row = 1,
					col = 2,
				},
				-- yadm = {
				-- 	enable = false,
				-- },
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map('n', ']g', function()
						if vim.wo.diff then return ']g' end
						vim.schedule(function() gs.next_hunk() end)
						return '<Ignore>'
					end, { desc = 'Gitsgins next_hunk', expr = true })
					map('n', '[g', function()
						if vim.wo.diff then return '[g' end
						vim.schedule(function() gs.prev_hunk() end)
						return '<Ignore>'
					end, { desc = 'Gitsgins prev_hunk', expr = true })

					-- Actions
					map('n', '<leader>gs', gs.stage_hunk, { desc = 'Gitsgins stage_hunk' })
					map('n', '<leader>gr', gs.reset_hunk, { desc = 'Gitsgins reset_hunk' })
					map(
						'v',
						'<leader>gs',
						function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
						{ desc = 'Gitsgins stage_hunk' }
					)
					map(
						'v',
						'<leader>gr',
						function() gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
						{ desc = 'Gitsgins reset_hunk' }
					)
					map('n', '<leader>gS', gs.stage_buffer, { desc = 'Gitsgins stage_buffer' })
					map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Gitsgins undo_stage_hunk' })
					map('n', '<leader>gR', gs.reset_buffer, { desc = 'Gitsgins reset_buffer' })
					map('n', '<leader>gp', gs.preview_hunk, { desc = 'Gitsgins preview_hunk' })
					map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = 'Gitsgins blame_line' })
					map('n', '<leader>gB', gs.toggle_current_line_blame, { desc = 'Gitsgins toggle_current_line_blame' })
					map('n', '<leader>gd', gs.diffthis, { desc = 'Gitsgins diffthis' })
					map('n', '<leader>gD', function() gs.diffthis '~' end, { desc = 'Gitsgins diffthis ~' })
					map('n', '<leader>gt', gs.toggle_deleted, { desc = 'Gitsgins toggle_deleted' })
					map('n', '<leader>gw', gs.toggle_word_diff, { desc = 'Gitsgins toggle_word_diff' })

					-- Text object
					map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsgins select_hunk' })
				end,
			}
		end,
	},
}
