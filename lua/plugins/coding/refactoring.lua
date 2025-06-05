local M = {
	{
		'ThePrimeagen/refactoring.nvim',
		cmd = { 'Refactor' },
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
		keys = {
			{
				'<leader>rf',
				function()
					return require('refactoring').refactor('Extract Function')
				end,
				mode = 'v',
				desc = 'Extract Function',
				expr = true,
			},
			{
				'<leader>rF',
				function()
					return require('refactoring').refactor('Extract Function To File')
				end,
				mode = 'v',
				desc = 'Extract Function To File',
				expr = true,
			},
			{
				'<leader>rv',
				function()
					return require('refactoring').refactor('Extract Variable')
				end,
				mode = 'v',
				desc = 'Extract Variable',
				expr = true,
			},
			{
				'<leader>ri',
				function()
					return require('refactoring').refactor('Inline Variable')
				end,
				mode = { 'n', 'v' },
				desc = 'Inline Variable',
				expr = true,
			},
			{
				'<leader>rb',
				function()
					return require('refactoring').refactor('Extract Block')
				end,
				desc = 'Extract Block',
				expr = true,
			},
			{
				'<leader>rB',
				function()
					return require('refactoring').refactor('Extract Block To File')
				end,
				desc = 'Extract Block To File',
				expr = true,
			},
		},
	},
}

return M
