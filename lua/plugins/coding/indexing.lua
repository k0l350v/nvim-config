local M = {
	{
		'Davidyz/VectorCode',
		cmd = 'VectorCode',
		version = '*',
		build = 'uv tool upgrade vectorcode',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'olimorris/codecompanion.nvim',
		opts = {
			extensions = {
				vectorcode = {
					opts = { add_tool = true },
				},
			},
		},
	},
}

return M
