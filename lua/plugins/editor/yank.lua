local M = {
	'gbprod/yanky.nvim',
	dependencies = {
		{ 'kkharji/sqlite.lua', enabled = not jit.os:find('Windows') },
	},
	opts = {
		highlight = { timer = 300 },
		ring = { storage = jit.os:find('Windows') and 'shada' or 'sqlite' },
	},
	keys = {
		{ 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
		{ '[y', '<Plug>(YankyCycleForward)', desc = 'Cycle forward through yank history' },
		{ ']y', '<Plug>(YankyCycleBackward)', desc = 'Cycle backward through yank history' },

		{ 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
		{ 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
		{ ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
		{ '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
		{ ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
		{ '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
	},
}

return M
