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

	map('v', '<Tab>', '>gv', { desc = 'Indent line' })
	map('v', '<S-Tab>', '<gv', { desc = 'Unindent' })

	map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

	map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
	map('n', '<C-q>', '<cmd>qa<cr>', { desc = 'Quit all' })

	map({ 'i', 'v', 'n', 't' }, '<A-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
	map({ 'i', 'v', 'n', 't' }, '<A-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
	map({ 'i', 'v', 'n', 't' }, '<A-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
	map({ 'i', 'v', 'n', 't' }, '<A-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
end

return M
