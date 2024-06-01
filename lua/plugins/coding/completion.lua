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
		local defaults = require('cmp.config.default')()
		return {
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			mapping = cmp.mapping.preset.insert({
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp', max_item_count = 5 },
				{ name = 'path', max_item_count = 5 },
			}, {
				{ name = 'buffer', max_item_count = 8 },
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
			formatting = {
				fields = { 'kind', 'abbr', 'menu' },
				format = function(entry, item)
					item.kind = require('icons').kind[item.kind]
					item.menu = '(' .. entry.source.name .. ')'
					return item
				end,
			},
		}
	end,
}

return M
