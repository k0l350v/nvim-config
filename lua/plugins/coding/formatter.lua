local M = {
	'stevearc/conform.nvim',
	cmd = 'ConformInfo',
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			['_'] = { 'trim_whitespace', 'trim_newlines' },
		},
	},
	config = function(_, opts)
		vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'

		require('conform').setup(opts)
	end,
}

return M
