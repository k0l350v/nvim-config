local M = {
	{
		'yetone/avante.nvim',
		build = ':AvanteBuild',
		cmd = {
			'AvanteAsk',
			'AvanteBuild',
			'AvanteEdit',
			'AvanteRefresh',
			'AvanteSwitchProvider',
			'AvanteChat',
			'AvanteToggle',
			'AvanteClear',
		},
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'stevearc/dressing.nvim',
			'nvim-lua/plenary.nvim',
			--- The below dependencies are optional,
			'nvim-tree/nvim-web-devicons',
		},
		keys = {
			{
				'<leader>at',
				function()
					require('avante.api').toggle()
				end,
				desc = 'AI assistance toggle',
				mode = { 'n', 'v' },
			},
			{
				'<leader>aa',
				function()
					require('avante.api').ask()
				end,
				desc = 'AI assistance ask',
				mode = { 'n', 'v' },
			},
			{
				'<leader>ar',
				function()
					require('avante.api').refresh()
				end,
				desc = 'AI assistance refresh',
			},
			{
				'<leader>ae',
				function()
					require('avante.api').edit()
				end,
				desc = 'AI assistance edit',
				mode = 'v',
			},
		},
		opts = {
			hints = { enabled = false },
		},
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		opts = {
			file_types = { 'markdown', 'Avante' },
		},
		ft = { 'markdown', 'Avante' },
	},
}

return M
