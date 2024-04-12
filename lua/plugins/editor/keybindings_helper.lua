local M = {
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'catppuccin',
		opts = {
			integrations = {
				which_key = true,
			},
		},
	},
}

return M
