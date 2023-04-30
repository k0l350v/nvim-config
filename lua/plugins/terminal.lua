local M = {
	'akinsho/toggleterm.nvim',
	cmd = 'ToggleTerm',
	opts = {},
	keys = {
		{ '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Terminal float window' },
		{ '<leader>ts', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', desc = 'Terminal horizontal window' },
		{ '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', desc = 'Terminal vertical window' },
	},
}

return M
