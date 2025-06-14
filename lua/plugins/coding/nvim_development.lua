local M = {
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		cmd = 'LazyDev',
		opts = {
			library = {
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
			},
		},
		{
			'saghen/blink.cmp',
			opts = {
				sources = {
					default = { 'lazydev' },
					providers = {
						lazydev = {
							name = 'LazyDev',
							module = 'lazydev.integrations.blink',
							score_offset = 100,
						},
					},
				},
			},
		},
	},
}

return M
