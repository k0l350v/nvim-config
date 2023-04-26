local M = {
	'sindrets/diffview.nvim',
	cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
	keys = {
		{ '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'DiffView' }
	},
}

return M
