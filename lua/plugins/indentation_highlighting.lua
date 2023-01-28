local M = {
	'lukas-reineke/indent-blankline.nvim',
	event = 'BufReadPost',
	opts = {
		show_current_context = true,
		use_treesitter = true,
	}
}

function M.config(_, opts)
	vim.opt.list = true
	vim.opt.listchars:append('space:·')
	vim.opt.listchars:append('eol:↴')
	vim.opt.listchars:append('tab:-->')

	require('indent_blankline').setup(opts)
end

return M
