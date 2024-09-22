local M = {
	{
		'MagicDuck/grug-far.nvim',
		opts = { headerMaxWidth = 80 },
		cmd = 'GrugFar',
		keys = {
			{
				'<leader>rS',
				function()
					local grug = require('grug-far')
					grug.grug_far({
						prefills = { flags = '-S' },
						engines = {
							ripgrep = {
								placeholders = { enabled = false },
							},
						},
					})
				end,
				mode = { 'n', 'v' },
				desc = 'Search and Replace',
			},
			{
				'<leader>rs',
				function()
					local grug = require('grug-far')
					grug.grug_far({
						prefills = {
							flags = '-S',
							paths = vim.fn.expand('%'),
						},
					})
				end,
				mode = { 'n', 'v' },
				desc = 'Search and Replace in current file',
			},
		},
	},
	{
		'folke/edgy.nvim',
		optional = true,
		opts = function(_, opts)
			opts.right = opts.right or {}
			table.insert(opts.right, {
				ft = 'grug-far',
				title = 'Grug Far',
				size = { width = 0.40, height = 0.30 },
			})
		end,
	},
	{
		'zbirenbaum/copilot.lua',
		optional = true,
		opts = {
			filetypes = {
				["grug-far"] = false,
				["grug-far-history"] = false,
				["grug-far-help"] = false,
			},
		},
	},
}

return M
