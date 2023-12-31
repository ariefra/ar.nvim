local userpath = vim.fn.stdpath 'config' .. '/lua/user'
if not vim.loop.fs_stat(userpath) then
	vim.fn.mkdir(userpath, 'p')
	print('Created ' .. userpath)
end
return {}
