local M = {
	'L3MON4D3/LuaSnip',
	opts = {},
	keys = {
		{
			'<Tab>', function()
				return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
			end, expr = true, mode = 'i',
		},
		{
			'<Tab>', function()
				require('luasnip').jump(1)
			end, mode = 's',
		},
		{
			'<S-Tab>', function()
				require('luasnip').jump(-1)
			end, mode = { 'i', 's' },
		},
	},
}

return M
