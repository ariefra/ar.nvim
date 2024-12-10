return {
	{
		-- 'https://github.com/saghen/blink.cmp',
		'https://github.com/hrsh7th/nvim-cmp.git',
		dependencies = {
			-- codeium
			{
				'https://github.com/Exafunction/codeium.nvim.git',
				cmd = 'Codeium',
				build = ':Codeium Auth',
				keys = { { '<leader>vc', '<cmd>Codeium Chat<cr>', mode = '', desc = 'Codeium Chat [web]' } },
				opts = {
					enable_chat = true,
				},
				dependencies = { { 'https://github.com/nvim-lua/plenary.nvim.git', lazy = true } },
			},
		},
		opts = function(_, opts)
			table.insert(opts.sources, 1, {
				name = 'codeium',
				group_index = 1,
				priority = 100,
			})
		end,
	},
	-- 2024.10.12 API key: eyJhbGciOiJSUzI1NiIsImtpZCI6IjhkOWJlZmQzZWZmY2JiYzgyYzgzYWQwYzk3MmM4ZWE5NzhmNmYxMzciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoidmFzdCBuZXQiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTEQteXpuU0JOUEdiazRPdlRia3J3azJiY0NxX3l5QmpmblBUNkdHSnpORUNqQlF3PXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL2V4YTItZmIxNzAiLCJhdWQiOiJleGEyLWZiMTcwIiwiYXV0aF90aW1lIjoxNzIxOTUwNTMyLCJ1c2VyX2lkIjoibDFPQ1N1UU42bFRoTktvWUVqOXZ5TW02eVZvMiIsInN1YiI6ImwxT0NTdVFONmxUaE5Lb1lFajl2eU1tNnlWbzIiLCJpYXQiOjE3Mjg3NjE5MjAsImV4cCI6MTcyODc2NTUyMCwiZW1haWwiOiJ2YXN0bmV0QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7Imdvb2dsZS5jb20iOlsiMTEyNDg4MTY5NjI5ODk0OTg4Mjk2Il0sImVtYWlsIjpbInZhc3RuZXRAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.kSEi4yvMkfqCJ-eHO0j8VrZcrMj-4KPE_wG52Ok2ujU9JVFQlA4WelHSSx8FAkYplLbtsPYRzWqQXiltxyBHTg_sMpxxlTRDe9an6hQ4jYmL7eXTPqbMcz56LYcuH7eEK7sImw6dIbHkyXawqMsgCfrd7cb5uV_eLToQxd6pLQJxIMSvf87mGK3QtC6jxE17mZPgneg-lQaLFXJlLXn_YzvkV1ow4NmQ2pAsfg77-wcYDDaIoVZI_33QMvek9KkoIVENCJUo6LM0hqRhX9SDfqmxndPGrSRWI9Sic1Do9x7_JY0CLNgy4RlKxYowQrh-AwnOFBazJ_kHNRJziVBFzw
	-- API key: eyJhbGciOiJSUzI1NiIsImtpZCI6IjBjYjQyNzQyYWU1OGY0ZGE0NjdiY2RhZWE0Yjk1YTI5ZmJhMGM1ZjkiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoidmFzdCBuZXQiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTEQteXpuU0JOUEdiazRPdlRia3J3azJiY0NxX3l5QmpmblBUNkdHSnpORUNqQlF3PXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL2V4YTItZmIxNzAiLCJhdWQiOiJleGEyLWZiMTcwIiwiYXV0aF90aW1lIjoxNzIxOTUwNTMyLCJ1c2VyX2lkIjoibDFPQ1N1UU42bFRoTktvWUVqOXZ5TW02eVZvMiIsInN1YiI6ImwxT0NTdVFONmxUaE5Lb1lFajl2eU1tNnlWbzIiLCJpYXQiOjE3MjE5NTEwODMsImV4cCI6MTcyMTk1NDY4MywiZW1haWwiOiJ2YXN0bmV0QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7Imdvb2dsZS5jb20iOlsiMTEyNDg4MTY5NjI5ODk0OTg4Mjk2Il0sImVtYWlsIjpbInZhc3RuZXRAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.UvGpfIrBEFwoFaZNebaDCyIk6tIQccRFXlDEPMBerBFkdmBZ2t0X0qXTOtkPbmFtROvxPFGCvXclrk0lVqv-LN1BOvK1_QJ5iMr4OOkNdevErqke8Xq6dJxIjLxUmhp4ELykMDsBOXtQmnKdCsd1RlfXa-f3SfKR52jB3JfbdHPUpu9X6moJa6BMy4bZCmx0mKnnkf5AIllfn8MP1e9Yof-p9zzoJqXYBDL5O-ZqCekTMEeHqE0IWLajm7jjvMuTmxL89__bLrWF1dMdhqoNac6hjFL6VP2SISs2slEbU3SLFD5KUa4aJ6aaiXI7VygHen577IJRkfNm_ZzLMOV2Tw

	-- -- codeium
	-- {
	-- 	'https://github.com/Exafunction/codeium.nvim.git',
	-- 	event = 'InsertEnter',
	-- 	cmd = { 'Codeium' },
	-- 	config = function()
	-- 		vim.keymap.set('i', '<tab>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
	-- 		-- 	-- vim.keymap.set('i', '<tab>', '<cmd>call codeium#Accept()<cr>', { desc = 'Codeium Accept' })
	-- 		-- 	-- vim.keymap.set('i', '<tab>', '<plug>(codeium-Accept)', { expr = true, silent = true })
	-- 		-- 	-- vim.keymap.set('i', '<tab>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
	-- 	end,
	-- },
}
