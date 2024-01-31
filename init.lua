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

vim.g.mapleader = ' '

require('lazy').setup {
  spec = {
    { import = 'base' },
  },
  concurrency = 2,
  performance = {
    cache = { enabled = true },
    rtp = {
      -- disable some rtp plugins
      -- stylua: ignore
      disabled_plugins = { '2html_plugin', 'tohtml', 'getscript', 'getscriptPlugin', 'gzip', 'logipat', 'netrw', 'netrwPlugin', 'netrwSettings', 'netrwFileHandlers', 'matchit', 'tar', 'tarPlugin', 'rrhelper', 'spellfile_plugin', 'vimball', 'vimballPlugin', 'zip', 'zipPlugin', 'tutor', 'rplugin', 'syntax', 'synmenu', 'optwin', 'compiler', 'bugreport', 'ftplugin', },
    },
  },
}
vim.cmd('colorscheme ' .. vim.g.color_name)
vim.cmd 'let &ro = &ro'
