local M = {
	'goolord/alpha-nvim',
	dependecies = { 'nvim-tree/nvim-web-devicons' },
	event = 'VimEnter',
}

function M.opts()
	local dashboard = require("alpha.themes.dashboard")
	return dashboard
end

function M.config(_, dashboard)
	require('alpha').setup(dashboard.opts)
end

return M
