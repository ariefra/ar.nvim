-- print 'codeium loaded'
vim.keymap.set(
	'i',
	'<Tab>',
	'<plug>(codeium-accept)<cmd>call codeium#Accept()<CR>',
	{ expr = true, desc = 'Codeium Accept' }
)
return {
	-- codeium
	{
		'https://github.com/Exafunction/codeium.vim',
		event = 'VeryLazy',
		cmd = { 'Codeium' },
		config = function() end,
	},
}
