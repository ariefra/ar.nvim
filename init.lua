vim.loader.enable()
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	print 'downloading lazy.nvim...'
	vim.opt.number = true
	vim.opt.relativenumber = false
	vim.fn.system {
	  'git',
	  'clone',
	  '--filter=blob:none',
	  'https://github.com/folke/lazy.nvim.git',
	  '--branch=stable',
	  lazypath,
	}
	print 'initiliazing...'
end
vim.opt.rtp:prepend(lazypath)
vim.opt.laststatus = 0
vim.g.mapleader = ' '
local lazy = require 'lazy'
lazy.setup {
	spec = { { import = 'base' } },
	concurrency = 5,
	checker = { enabled = false, frequency = 14400, notify = false },
	profiling = { loader = false, require = false },
	performance = {
	  cache = { enabled = true },
	  rtp = {
	    -- disable some rtp plugins
	    -- stylua: ignore
	    disabled_plugins = { 'man', 'matchparen', 'spellfile', 'editorconfig', '2html_plugin', 'tohtml', 'getscript', 'getscriptPlugin', 'gzip', 'logipat', 'netrw', 'netrwPlugin', 'netrwSettings', 'netrwFileHandlers', 'matchit', 'tar', 'tarPlugin', 'rrhelper', 'spellfile_plugin', 'vimball', 'vimballPlugin', 'zip', 'zipPlugin', 'tutor', 'rplugin', 'syntax', 'synmenu', 'optwin', 'compiler', 'bugreport', 'ftplugin', },
	  },
	},
}
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
-- vim.g.colors_name = vim.g.colors_name or 'oxocarbon'
-- vim.g.colors_name = 'oxocarbon'
vim.g.colors_name_dark = vim.g.colors_name_dark or vim.g.colors_name
vim.g.colors_name_light = vim.g.colors_name_light or vim.g.colors_name
if vim.g.autolight then
	local hour = tonumber(os.date '%H')
	if hour > (vim.g.autolight_end or 17) or hour < (vim.g.autolight_start or 7) then
	  vim.opt.bg = 'dark'
	  vim.cmd('colorscheme ' .. (vim.g.colors_name_dark or 'habamax'))
	else
	  vim.opt.bg = 'light'
	  vim.cmd('colorscheme ' .. (vim.g.colors_name_light or 'habamax'))
	end
else
	vim.cmd('colorscheme ' .. (vim.g.colors_name or 'habamax'))
end
-- if vim.opt.bg:get() == 'dark' then
-- else
-- end
vim.api.nvim_create_autocmd('User', {
	pattern = 'LazyVimStarted',
	callback = function()
	  local stats = lazy.stats()
	  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
	  require('fidget').notify(
	    '' .. 'neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms',
	    vim.log.levels.INFO
	  )
	end,
})
