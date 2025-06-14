local M = {
	{
		'L3MON4D3/LuaSnip',
		dependencies = {
			'rafamadriz/friendly-snippets',
		},
		opts = {},
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
