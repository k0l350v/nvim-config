local M = {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = false,
	opts = {
		flavour = 'mocha',
		transparent_background = false,
		term_colors = true,
		custom_highlights = function (colors)
			local utils = require('catppuccin.utils.colors')
			return {
				DiffViewDelete = { bg = utils.darken(colors.red, 0.2, colors.base) },
				DiffViewAdd = { bg = utils.darken(colors.green, 0.2, colors.base) },
				DiffViewTextDelete = { bg = utils.darken(colors.red, 0.6, colors.base) },
				DiffViewTextAdd = { bg = utils.darken(colors.green, 0.6, colors.base) },
			}
		end
	},
}

function M.config(_, opts)
	require('catppuccin').setup(opts)

	vim.cmd.colorscheme 'catppuccin'
end


return M
