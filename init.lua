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
require('lazy').setup {
  spec = { { import = 'base' } },
  -- concurrency = 2,
  checker = { enabled = true, frequency = 14400, notify = false },
  profiling = {
    -- loader = true,
    -- require = true,
  },
  performance = {
    -- cache = { enabled = true },
    rtp = {
      -- disable some rtp plugins
      -- stylua: ignore
      disabled_plugins = { 'man', 'matchparen', 'spellfile', 'editorconfig', '2html_plugin', 'tohtml', 'getscript', 'getscriptPlugin', 'gzip', 'logipat', 'netrw', 'netrwPlugin', 'netrwSettings', 'netrwFileHandlers', 'matchit', 'tar', 'tarPlugin', 'rrhelper', 'spellfile_plugin', 'vimball', 'vimballPlugin', 'zip', 'zipPlugin', 'tutor', 'rplugin', 'syntax', 'synmenu', 'optwin', 'compiler', 'bugreport', 'ftplugin', },
    },
  },
}
if vim.g.autolight then
  local hour = tonumber(os.date '%H')
  if hour > (vim.g.autolight_end or 18) or hour < (vim.g.autolight_start or 7) then
    vim.opt.bg = 'dark'
  else
    vim.opt.bg = 'light'
  end
end
if vim.opt.bg:get() == 'dark' then
  vim.cmd('colorscheme ' .. (vim.g.colors_name_dark or 'habamax'))
else
  vim.cmd('colorscheme ' .. (vim.g.colors_name_light or 'habamax'))
end
