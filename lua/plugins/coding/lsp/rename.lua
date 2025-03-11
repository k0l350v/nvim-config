local M = {
	{
		'smjonas/inc-rename.nvim',
		cmd = 'IncRename',
		opts = {},
		keys = {
			{
				'<leader>sr',
				function()
					require('inc_rename')
					return ':IncRename ' .. vim.fn.expand('<cword>')
				end,
				expr = true,
				desc = 'Symbol Rename',
			},
		},
	},
	{
		'folke/noice.nvim',
		optional = true,
		opts = {
			presets = { inc_rename = true },
		},
	},
}

return M
