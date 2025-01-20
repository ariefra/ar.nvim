local o = vim.opt
o.shm = 'aIFt'
o.ts = 2
o.shiftwidth = 2
o.expandtab = true
o.signcolumn = 'auto:1-2'
o.numberwidth = 1
-- o.number = true
o.relativenumber = false
o.laststatus = 0
-- o.showcmd = true
o.showcmdloc = 'statusline'
o.statusline = nil
o.cmdheight = 0
-- o.foldmethod = 'indent'
o.guicursor = 'i-ci-ve:hor1'
o.fillchars = 'eob: '
o.listchars = 'tab:   '
-- eol = '⤶',
-- space = '␠',
-- multispace = '   ␠',
-- lead = '.',
-- leadmultispace = '   .',
-- trail = '.',
-- extends = '⋯',
-- precedes = '⋯',
-- conceal = '⋆',
-- nbsp = '␠',
-- o.showtabline = 1
o.cursorline = true
o.timeoutlen = 200
-- o.number = true
-- o.relativenumber = false
-- o.splitright = true
-- o.wrap = false
-- o.ignorecase = true
-- o.modeline = true
-- o.list = true

local g = vim.g
g.ministarter_autoopen = false

g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- g.autolight = true
g.colors_name = 'oxocarbon'
return {
  { 'https://github.com/nyoom-engineering/oxocarbon.nvim.git', },
}
