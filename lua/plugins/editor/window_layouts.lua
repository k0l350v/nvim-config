local M = {
	{
		'folke/edgy.nvim',
		event = 'VeryLazy',
		opts = {
			animate = {
				enabled = false,
			},
			wo = {
				winbar = false,
			},
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		optional = true,
		opts = {
			defaults = {
				get_selection_window = function()
					require('edgy').goto_main()
					return 0
				end,
			},
		},
	},
}

return M
