local M = {
	{
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufReadPost',
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
		},
		config = function(_, opts)
			vim.opt.list = true
			vim.opt.listchars:append('space:·')
			vim.opt.listchars:append('eol:↴')
			vim.opt.listchars:append('tab:-->')

			require('ibl').setup(opts)
		end
	},
	{
		'echasnovski/mini.indentscope',
		version = false,
		event = 'BufReadPost',
		opts = {
			symbol = '│',
			options = { try_as_border = true },
		},
	}
}

return M
