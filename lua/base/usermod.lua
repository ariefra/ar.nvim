local userpath = vim.fn.stdpath 'config' .. '/lua/user'
if not vim.loop.fs_stat(userpath) then
  print 'creating customization template ...'
  vim.fn.mkdir(userpath, 'p')
  vim.fn.writefile(
    {
      '-- custom init code here',
      'local hour = tonumber(os.date("%H"))',
      'if hour >= 6 and hour < 18 then vim.o.bg = "light" else vim.o.bg = "dark" end',
      'return {',
      '-- custom plugins spec here',
      '}'
    },
    userpath .. '/custom.lua'
  )
  return {}
end
return { import = 'user/custom' }
