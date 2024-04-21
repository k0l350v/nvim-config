local M = {
	'hrsh7th/nvim-cmp',
	version = false,
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
	},
	opts = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local defaults = require('cmp.config.default')()
		return {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-CR>'] = function(fallback)
					cmp.abort()
					fallback()
				end,
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'path' },
			}),
			experimental = {
				native_menu = false,
				ghost_text = true,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sorting = defaults.sorting,
		}
	end,
}

return M
