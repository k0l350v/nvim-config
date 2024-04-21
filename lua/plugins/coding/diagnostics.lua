local M = {
	'folke/trouble.nvim',
	lazy = false,
	branch = 'dev',
	keys = {
		{ '<leader>dt', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
		{ "<leader>dT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
	},
	opts = {},
}

return M
