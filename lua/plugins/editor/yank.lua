local M = {
	'gbprod/yanky.nvim',
	dependencies = {
		{ 'telescope.nvim' },
		{ 'kkharji/sqlite.lua', enabled = not jit.os:find('Windows') },
	},
	opts = function ()
		local mapping = require('yanky.telescope.mapping')
		local mappings = mapping.get_defaults()
		mappings.i['<c-p>'] = nil
		return {
			highlight = { timer = 300 },
			ring = { storage = jit.os:find('Windows') and 'shada' or 'sqlite' },
			picker = {
				telescope = {
					use_default_mappings = false,
					mappings = mappings,
				}
			}
		}
	end,
	keys = {
		{ '<leader>p', function() require('telescope').extensions.yank_history.yank_history({ }) end, desc = 'Open Yank History' },
		{ 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
		{ '[y', '<Plug>(YankyCycleForward)', desc = 'Cycle forward through yank history' },
		{ ']y', '<Plug>(YankyCycleBackward)', desc = 'Cycle backward through yank history' },

		{ 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
		{ 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
		{ ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
		{ '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
		{ ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
		{ '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
	}
}

return M
