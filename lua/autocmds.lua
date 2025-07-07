local M = {}

local augroup = vim.api.nvim_create_augroup('AutoReload', { clear = true })

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
end

return M
