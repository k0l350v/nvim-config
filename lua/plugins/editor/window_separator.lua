local M = {
	'nvim-zh/colorful-winsep.nvim',
	event = { 'WinEnter' },
	opts = {
		hi = {
			link = 'Identifier',
		},
		no_exec_files = {},
		symbols = { '─', '│', '╭', '╮', '╰', '╯' },
		smooth = false,
	},
}

return M
