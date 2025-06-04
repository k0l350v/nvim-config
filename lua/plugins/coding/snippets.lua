local M = {
	{
		'L3MON4D3/LuaSnip',
		dependencies = {
			'rafamadriz/friendly-snippets',
		},
		opts = {},
		keys = {
			{
				'<Tab>',
				function()
					return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
				end,
				expr = true,
				mode = 'i',
			},
			{
				'<Tab>',
				function()
					require('luasnip').jump(1)
				end,
				mode = 's',
			},
			{
				'<S-Tab>',
				function()
					require('luasnip').jump(-1)
				end,
				mode = { 'i', 's' },
			},
		},
	},
	{
		'saghen/blink.cmp',
		optional = true,
		opts = {
			snippets = {
				preset = 'luasnip',
			},
		},
	},
	{
		'rafamadriz/friendly-snippets',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	},
}

return M
