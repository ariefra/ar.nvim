return {
  {
    'https://github.com/echasnovski/mini.statusline',
    event = { 'BufAdd', 'BufReadPost' },
    config = function()
      local MiniStatusline = require 'mini.statusline'
      vim.opt.laststatus = 3
      MiniStatusline.setup {
        -- Content of statusline as functions which return statusline string. See
        -- `:h statusline` and code of default contents (used instead of `nil`).
        content = {
          -- Content for active window
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            local git = MiniStatusline.section_git { trunc_width = 75 }
            local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
            local filename = MiniStatusline.section_filename { trunc_width = 140 }
            local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
            local location = MiniStatusline.section_location { trunc_width = 75 }
            local search = MiniStatusline.section_searchcount { trunc_width = 75 }
            -- vim.opt.laststatus = 3

            return MiniStatusline.combine_groups {
              { hl = mode_hl },
              { strings = { mode } },
              { hl = 'MiniStatuslineInactive', strings = { git, diagnostics, search } },
              '%=', -- Start center alignment
              '%<', -- Mark general truncate point
              { strings = { filename } },
              '%=', -- start right alignment
              { hl = 'MiniStatuslineInactive', strings = { fileinfo } },
              { strings = { location } },
            }
          end,
          inactive = function() end,
        },
        set_vim_settings = false,
      }
    end,
  },
}
