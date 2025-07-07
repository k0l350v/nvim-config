local M = {}

local augroup = vim.api.nvim_create_augroup('AutoReload', { clear = true })
local autosave_augroup = vim.api.nvim_create_augroup('AutoSave', { clear = true })

function M.setup()
	vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave', 'CursorHold', 'CursorHoldI' }, {
		group = augroup,
		desc = 'Auto-reload files when they are changed externally',
		callback = function()
			if vim.o.buftype ~= 'nofile' then
				vim.cmd('checktime')
			end
		end,
	})

	vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
		group = autosave_augroup,
		desc = 'Auto-save buffer when leaving insert mode, after text changes',
		callback = function()
			if vim.bo.modified and vim.bo.buftype == '' and vim.fn.expand('%') ~= '' and not vim.bo.readonly then
				vim.cmd('silent! write')
			end
		end,
	})
end

return M
