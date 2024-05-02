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
		'nvim-cmp',
		dependencies = {
			'saadparwaiz1/cmp_luasnip',
		},
		opts = function(_, opts)
			opts.snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			}
			table.insert(opts.sources, { name = 'luasnip' })
		end,
	},
	{
		'rafamadriz/friendly-snippets',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	},
}

return M
