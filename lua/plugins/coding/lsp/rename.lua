local M = {
	{
		'smjonas/inc-rename.nvim',
		cmd = 'IncRename',
		opts = {},
		keys = {
			{
				'<leader>sr',
				function()
					local inc_rename = require('inc_rename')
					return ':' .. inc_rename.config.cmd_name .. ' ' .. vim.fn.expand('<cword>')
				end,
				expr = true,
				desc = 'Rename (inc-rename.nvim)',
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
