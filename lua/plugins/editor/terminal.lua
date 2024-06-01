local M = {
	'akinsho/toggleterm.nvim',
	cmd = 'ToggleTerm',
	opts = {},
	keys = {
		{ '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Terminal float window' },
		{ '<leader>ts', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', desc = 'Terminal horizontal window' },
		{ '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', desc = 'Terminal vertical window' },

		{ '<C-w>h', '<cmd>wincmd h<cr>', desc = 'Go to the left window', mode = 't'},
		{ '<C-w>j', '<cmd>wincmd j<cr>', desc = 'Go to the lower window', mode = 't'},
		{ '<C-w>k', '<cmd>wincmd k<cr>', desc = 'Go to the up window', mode = 't'},
		{ '<C-w>l', '<cmd>wincmd l<cr>', desc = 'Go to the right window', mode = 't'},

		{ '<C-w>d', '<cmd>:bd!<cr>', desc = 'Close terminal window', mode = 't'},
		{ '<C-w>q', '<cmd>close<cr>', desc = 'Close terminal window', mode = 't'},
	},
}

return M
