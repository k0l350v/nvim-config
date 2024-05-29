local M = {
	'nvim-zh/colorful-winsep.nvim',
	event = { 'WinEnter' },
	opts = {
		hi = {
			link = 'Identifier',
		},
		symbols = { '─', '│', '╭', '╮', '╰', '╯' },
		smooth = false,
	},
}

return M
