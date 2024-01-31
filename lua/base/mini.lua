return {
  -- {
  -- 	'https://github.com/echasnovski/mini.tabline',
  -- 	event = 'VeryLazy',
  -- 	keys = {
  -- 		-- { '<tab>', '<cmd>bnext<cr>', desc = 'Next Buffer' },
  -- 		-- { '<s-tab>', '<cmd>bprev<cr>', desc = 'Prev Buffer' },
  -- 		-- { '<c-tab>', '<cmd>tabnext<cr>', desc = 'Next Tab' },
  -- 		-- { '<c-s-tab>', '<cmd>tabprev<cr>', desc = 'Prev Tab' },
  -- 	},
  -- 	opts = {
  -- 		-- Whether to show file icons (requires 'nvim-tree/nvim-web-devicons')
  -- 		show_icons = true,
  --
  -- 		-- Whether to set Vim's settings for tabline (make it always shown and
  -- 		-- allow hidden buffers)
  -- 		-- set_vim_settings = true,
  --
  -- 		-- Where to show tabpage section in case of multiple vim tabpages.
  -- 		-- One of 'left', 'right', 'none'.
  -- 		tabpage_section = 'right',
  -- 	},
  -- },
  {
    'https://github.com/echasnovski/mini.starter',
    lazy = false,
    event = 'VeryLazy',
    keys = {
      { '<F4>', '<cmd>lua MiniStarter.open()<cr>', desc = 'Dashboard' },
    },
    config = function()
      local starter = require 'mini.starter'
      starter.setup {
        autoopen = vim.g.ministarter_autoopen,
        evaluate_single = true,
        -- header = '\t\t\t\t...the mini you become, the more you can make',
        footer = '<cr>\tto select\n<c-c>\tto cancel\n<f4>\tshow again this dialog\n<sp>\tfor leader\n<\\>\t\tfor toggles\n<[>\t\tfor bracketed',
        items = {
          starter.sections.recent_files(9, true),
          starter.sections.builtin_actions(),
          { name = 'Starter close',   action = 'lua require("mini.starter").close()', section = 'Builtin actions' },
          { name = 'Profile Startup', action = 'Lazy profile',                        section = 'Builtin actions' },
          { name = 'Update Plugins',  action = 'Lazy update',                         section = 'Builtin actions' },
          { name = 'MasonInstallAll', action = 'MasonInstallAll',                     section = 'Builtin actions' },
          { name = 'Git commits',     action = 'Pick git_commits',                    section = 'Pick' },
          { name = 'Options',         action = 'Pick options',                        section = 'Pick' },
          { name = 'Keymaps',         action = 'Pick keymaps',                        section = 'Pick' },
          { name = 'Registers',       action = 'Pick registers',                      section = 'Pick' },
          starter.sections.pick(),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing('all', { 'Builtin actions', 'Pick' }),
          starter.gen_hook.aligning('center', 'top'),
          -- starter.gen_hook.padding(20, 5),
        },
      }
    end,
  },
  -- mini
  {
    'https://github.com/echasnovski/mini.nvim.git',
    event = 'VeryLazy',
    keys = {
      -- mini.pick
      { '<F1>',       '<cmd>Pick help<cr>',                                               desc = 'Help Index' },
      { '<F2>',       '<cmd>Pick oldfiles<cr>',                                           desc = 'Recent Files' },
      { '<F3>',       '<cmd>Pick files<cr>',                                              desc = 'Find Files' },
      { '<F5>',       '<cmd>Pick buffers<cr>',                                            desc = 'Buffers' },
      { '<F6>',       '<cmd>Pick grep_live<cr>',                                          desc = 'Grep Live' },
      { '<F7>',       '<cmd>Pick grep<cr>',                                               desc = 'Grep Pattern' },
      { '<F8>',       '<cmd>Pick explorer<cr>',                                           desc = 'Explorer' },
      { '<leader>tb', '<cmd>Pick buffers<cr>',                                            desc = 'Buffers' },
      { '<leader>te', '<cmd>Pick explorer<cr>',                                           desc = 'Explorer' },
      { '<leader>tf', '<cmd>Pick files<cr>',                                              desc = 'Find Files' },
      { '<leader>tg', '<cmd>Pick grep<cr>',                                               desc = 'Grep Pattern' },
      { '<leader>tl', '<cmd>Pick grep_live<cr>',                                          desc = 'Grep Live' },
      { '<leader>to', '<cmd>Pick oldfiles<cr>',                                           desc = 'Recent Files' },

      -- mini.files
      { '<leader>e',  '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<cr>', desc = 'Mini Files' },

      -- mini.comment
      -- 'gc',
      -- 'gcc',

      -- mini.align
      -- 'ga',
      -- 'gA',

      -- mini.splitjoin
      -- 'gS',

      -- mini.bracketed
      -- '[',
      -- ']',

      -- mini.trailspace
      {
        '<leader>d<space>',
        '<cmd>lua MiniTrailspaces.trim()<cr>',
        desc = 'Trim Trailing Spaces',
      },

      -- mini.jump2d
      { '<leader>hl', '<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.line_start)<cr>',       desc = 'Hop to line start' },
      { '<leader>hw', '<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<cr>',       desc = 'Hop to word start' },
      { '<leader>hq', '<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.query)<cr>',            desc = 'Hop to user query' },
      { '<leader>hs', '<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<cr>', desc = 'Hop to line char' },
    },
    config = function()
      require('mini.basics').setup {
        options = { extra_ui = true, win_borders = 'solid' },
        mappings = { windows = true, move_with_alt = true },
        autocommands = { relnum_in_visual_mode = true },
      }
      -- require('mini.animate').setup {}
      -- require('mini.base16').setup {}
      -- require('mini.colors').setup {}
      -- require('mini.doc').setup {}
      -- require('mini.operators').setup {}
      -- require('mini.test').setup {}
      require('mini.align').setup {}
      require('mini.bracketed').setup {}
      require('mini.bufremove').setup {}
      require('mini.comment').setup {}
      require('mini.extra').setup {}
      local gen_ai_spec = require('mini.extra').gen_ai_spec
      require('mini.ai').setup {
        custom_textobjects = {
          B = gen_ai_spec.buffer(),
          D = gen_ai_spec.diagnostic(),
          I = gen_ai_spec.indent(),
          L = gen_ai_spec.line(),
          N = gen_ai_spec.number(),
        },
      }
      require('mini.fuzzy').setup {}
      require('mini.hipatterns').setup {}
      require('mini.jump2d').setup {}
      require('mini.jump').setup {
        delay = {
          highlight = 100,
          idle_stop = 7000,
        }
      }
      vim.cmd [[hi MiniJump gui=bold,italic]]
      require('mini.map').setup {}
      require('mini.misc').setup {}
      require('mini.misc').setup_auto_root()
      require('mini.misc').setup_restore_cursor()
      require('mini.move').setup {}
      require('mini.pairs').setup {}
      require('mini.sessions').setup { autowrite = true }
      require('mini.splitjoin').setup {}
      local MiniStatusline = require('mini.statusline')
      MiniStatusline.setup {
        -- Content of statusline as functions which return statusline string. See
        -- `:h statusline` and code of default contents (used instead of `nil`).
        content = {
          -- Content for active window
          active =
              function()
                local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                local git           = MiniStatusline.section_git({ trunc_width = 75 })
                local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
                local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                local location      = MiniStatusline.section_location({ trunc_width = 75 })
                local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

                return MiniStatusline.combine_groups({
                  { hl = mode_hl,                  strings = { mode } },
                  { hl = 'MiniStatuslineInactive', strings = { git, diagnostics } },
                  '%=', -- Start center alignment
                  '%<', -- Mark general truncate point
                  { strings = { filename } },
                  '%=', -- start right alignment
                  { strings = { fileinfo } },
                  { strings = { search, location } },
                })
              end,
        },
        set_vim_settings = false
      }
      require('mini.surround').setup {}
      require('mini.trailspace').setup {}
      require('mini.tabline').setup {}
      -- require('mini.visits').setup {}
      require('mini.files').setup {
        windows = {
          max_number = 3,
          preview = true,
          width_preview = 75,
        },
        mappings = {
          close = '<esc>',
          go_in = 'L',
          go_in_plus = '<cr>',
          go_out = 'H',
          go_out_plus = '<bs>',
          reset = '<s-bs>',
        },
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
          border = 'none',
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

      -- require('mini.notify').setup {
      -- 	window = {
      -- 		config = win_config,
      -- 	},
      -- }
      -- vim.notify = require('mini.notify').make_notify()

      require('mini.indentscope').setup {
        draw = {
          delay = 250,
          animation = require('mini.indentscope').gen_animation.quartic() -- { easing = 'out', duration = 10, unit = 'step', },
        },
        symbol = '│',
      }
      vim.cmd [[ hi MiniIndentscopeSymbol ctermfg=NONE ctermbg=NONE guifg='#444444' guibg=NONE ]]

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
          force_twostep = '<c-space>',    -- Force two-step completion
          force_fallback = '<c-s-space>', -- Force fallback completion
        },
        -- set_vim_settings = true,
      }
    end,
  },
}
