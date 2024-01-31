local userpath = vim.fn.stdpath 'config' .. '/lua/user'
if not vim.loop.fs_stat(userpath) then
  vim.fn.mkdir(userpath, 'p')
  print('Created ' .. userpath)
  vim.fn.writefile(
    {
      '-- custom init code here',
      'return {',
      '-- custom plugins spec here',
      '}'
    },
    userpath .. '/custom.lua'
  )
end
return {}
