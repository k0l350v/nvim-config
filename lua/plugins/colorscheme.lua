local M = {
	'arzg/vim-colors-xcode',
	lazy = false,
}

function M.config()
	pcall(vim.cmd, [[colorscheme xcodedarkhc]])
end

return M
