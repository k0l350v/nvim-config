local M = {}

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	vim.keymap.set(mode, lhs, rhs, opts)
end

function M.load_keymaps()
	map('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
	map('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

	map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
	map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
	map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
	map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
	map('v', '<A-j>', ':m ">+1<cr>gv=gv', { desc = 'Move down' })
	map('v', '<A-k>', ':m "<-2<cr>gv=gv', { desc = 'Move up' })

	map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

	map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
	map('n', '<C-q>', '<cmd>qa<cr>', { desc = 'Quit all' })
end

return M
