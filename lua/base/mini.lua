vim.g.ministarter_disable_start = true
return {
	-- mini
	{
		'https://github.com/echasnovski/mini.nvim.git',
		event = 'VeryLazy',
		keys = {
			-- mini.pick
			{ '<F1>', '<cmd>Pick help<cr>', desc = 'Help Index' },
			{ '<F2>', '<cmd>Pick oldfiles<cr>', desc = 'Recent Files' },
			{ '<F3>', '<cmd>Pick files<cr>', desc = 'Find Files' },
			{ '<F5>', '<cmd>Pick buffers<cr>', desc = 'Buffers' },
			{ '<F6>', '<cmd>Pick grep_live<cr>', desc = 'Grep Live' },
			{ '<F7>', '<cmd>Pick grep<cr>', desc = 'Grep Pattern' },
			{ '<F8>', '<cmd>Pick explorer<cr>', desc = 'Explorer' },
			{ '<leader>tb', '<cmd>Pick buffers<cr>', desc = 'Buffers' },
			{ '<leader>te', '<cmd>Pick explorer<cr>', desc = 'Explorer' },
			{ '<leader>tf', '<cmd>Pick files<cr>', desc = 'Find Files' },
			{ '<leader>tg', '<cmd>Pick grep<cr>', desc = 'Grep Pattern' },
			{ '<leader>tl', '<cmd>Pick grep_live<cr>', desc = 'Grep Live' },
			{ '<leader>to', '<cmd>Pick oldfiles<cr>', desc = 'Recent Files' },

			-- mini.starter
			{ '<F4>', '<cmd>lua MiniStarter.open()<cr>', desc = 'Dashboard' },

			-- mini.files
			{ '<leader>e', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<cr>', desc = 'Mini Files' },

			-- mini.comment
			-- 'gc',
			-- 'gcc',

			-- mini.tabline
			-- { '<tab>', '<cmd>bnext<cr>', desc = 'Next Buffer' },
			-- { '<s-tab>', '<cmd>bprev<cr>', desc = 'Prev Buffer' },
			-- { '<c-tab>', '<cmd>tabnext<cr>', desc = 'Next Tab' },
			-- { '<c-s-tab>', '<cmd>tabprev<cr>', desc = 'Prev Tab' },

			-- mini.align
			-- 'ga',
			-- 'gA',

			-- mini.splitjoin
			-- 'gS',

			-- mini.bracketed
			-- '[',
			-- ']',

			-- mini.trailspace
			{ '<leader>d<space>', '<cmd>lua MiniTrailspaces.trim()<cr>', desc = 'Trim Trailing Spaces' },
		},
		config = function()
			require('mini.basics').setup {
				options = { extra_ui = true, win_borders = 'double' },
				mappings = { windows = true, move_with_alt = true },
				autocommands = { relnum_in_visual_mode = true },
			}
			require('mini.align').setup {}
			require('mini.bracketed').setup {}
			require('mini.comment').setup {}
			require('mini.pairs').setup {}
			require('mini.extra').setup {}
			require('mini.splitjoin').setup {}
			local status = require 'mini.statusline'
			status.setup {
				content = {
					inactive = function()
						local mode, mode_hl = status.section_mode { trunc_width = 120 }
						local git = status.section_git { trunc_width = 75 }
						local diagnostics = status.section_diagnostics { trunc_width = 75 }
						local filename = status.section_filename { trunc_width = 140 }
						local fileinfo = status.section_fileinfo { trunc_width = 120 }
						local location = status.section_location { trunc_width = 75 }
						local search = status.section_searchcount { trunc_width = 75 }

						return status.combine_groups {
							{ hl = mode_hl, strings = { mode } },
							{ hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
							'%<', -- Mark general truncate point
							{ hl = 'MiniStatuslineFilename', strings = { filename } },
							'%=', -- End left alignment
							{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
							{ hl = mode_hl, strings = { search, location } },
						}
					end,
					active = function()
						return '%='
					end,
				},
			}
			require('mini.surround').setup {}
			require('mini.tabline').setup {}
			require('mini.ai').setup {}
			require('mini.fuzzy').setup {}
			require('mini.hipatterns').setup {}
			require('mini.jump').setup {}
			require('mini.map').setup {}
			require('mini.misc').setup {}
			require('mini.misc').setup_auto_root()
			require('mini.misc').setup_restore_cursor()
			require('mini.move').setup {}
			require('mini.visits').setup {}
			-- require('mini.operators').setup {}
			-- require('mini.test').setup {}
			require('mini.trailspace').setup {}
			-- require('mini.colors').setup {}
			-- require('mini.jump2d').setup {}
			-- require('mini.animate').setup {}
			-- require('mini.base16').setup {}
			require('mini.bufremove').setup {}
			-- require('mini.doc').setup {}
			require('mini.files').setup {
				windows = {
					max_number = 3,
					preview = true,
					width_preview = 75,
				},
				mappings = {
					go_in = 'L',
					go_in_plus = '<cr>',
					go_out = 'H',
					go_out_plus = '<bs>',
					reset = '<s-bs>',
				},
			}
			require('mini.sessions').setup {
				autowrite = true,
			}

			local win_config = function()
				local height = math.floor(0.4 * vim.o.lines)
				local width = math.floor(0.7 * vim.o.columns)
				return {
					anchor = 'NW',
					height = height,
					width = width,
					row = math.floor(0.5 * (vim.o.lines - height)),
					col = math.floor(0.5 * (vim.o.columns - width)),
				}
			end
			require('mini.pick').setup {
				options = { use_cache = true },
				window = { config = win_config },
			}
			-- overide vim.ui.select
			vim.ui.select = function(items, opts, on_choice)
				require('mini.pick').ui_select(items, opts, on_choice)
			end
			require('mini.indentscope').setup {
				draw = {
					delay = 0,
					animation = require('mini.indentscope').gen_animation.none {
						easing = 'out',
						duration = 10,
						unit = 'step',
					},
				},
				symbol = '│',
			}

			local miniclue = require 'mini.clue'
			miniclue.setup {
				windows = { delay = 1 },
				triggers = {
					-- Leader triggers
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },

					-- Built-in completion
					{ mode = 'i', keys = '<C-x>' },

					-- `g` key
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },

					-- `s` key
					{ mode = 'n', keys = 's' },
					{ mode = 'x', keys = 's' },

					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					{ mode = 'x', keys = "'" },
					{ mode = 'x', keys = '`' },

					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					{ mode = 'i', keys = '<C-r>' },
					{ mode = 'c', keys = '<C-r>' },

					-- Window commands
					{ mode = 'n', keys = '<C-w>' },

					-- `z` key
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },

					-- `\` key
					{ mode = 'n', keys = '\\' },
					{ mode = 'x', keys = '\\' },

					-- `[` key
					{ mode = 'n', keys = '[' },
					{ mode = 'x', keys = '[' },

					-- `]` key
					{ mode = 'n', keys = ']' },
					{ mode = 'x', keys = ']' },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					-- miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			}

			-- mini.completion
			require('mini.completion').setup {
				-- delay = { completion = 0, info = 0, signature = 0 },
				window = {
					info = { height = 25, width = 80, border = 'none' },
					signature = { height = 25, width = 80, border = 'none' },
				},
				mappings = {
					force_twostep = '<c-space>', -- Force two-step completion
					force_fallback = '<c-s-space>', -- Force fallback completion
				},
				-- set_vim_settings = true,
			}

			-- mini.starter
			local starter = require 'mini.starter'
			starter.setup {
				-- evaluate_single = true,
				header = '\t\t\t\t...the mini you become, the more you can make',
				footer = '<cr>\t\tto select\n<c-c>\tto cancel\n<f4>\t\tshow again this dialog\n<sp>\t\tfor leader\n<\\>\t\tfor toggles\n<[>\t\tfor bracketed',
				items = {
					starter.sections.builtin_actions(),
					starter.sections.recent_files(9, true),
					starter.sections.sessions(5, true),
					starter.sections.pick(),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.indexing('all', { 'Builtin actions' }),
					starter.gen_hook.aligning('center', 'center'),
					-- starter.gen_hook.padding(20, 5),
				},
			}

			assert(vim.cmd('colorscheme ' .. (vim.g.color_name or 'minischeme')))
			if not vim.g.ministarter_disable_start then
				require('mini.starter').open()
			end
		end,
	},
}
