local o = vim.opt
o.shm = 'I'
o.ts = 2
o.shiftwidth = 2
o.expandtab = true
o.signcolumn = 'number'
o.laststatus = 3
-- o.showcmd = true
-- o.showcmdloc = 'statusline'
-- o.cmdheight = 0
o.guicursor = 'i-ci-ve:hor1'
o.fillchars = { eob = ' ' }
o.listchars = {
	tab = '  ',
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
}
-- o.number = true
-- o.relativenumber = false
-- o.splitright = true
-- o.wrap = false
-- o.ignorecase = true
-- o.modeline = true
-- o.list = true

local g = vim.g
-- g.mapleader = '\\'

if tonumber(os.date '%H') > 18 or tonumber(os.date '%H') < 7 then
	o.bg = 'dark'
else
	o.bg = 'light'
end

return {}
