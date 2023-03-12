local M = {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = false,
	opts = {
		flavour = 'mocha',
		transparent_background = true,
		term_colors = true,
	},
}

function M.config(_, opts)
	require('catppuccin').setup(opts)

	vim.cmd.colorscheme 'catppuccin'
end


return M
