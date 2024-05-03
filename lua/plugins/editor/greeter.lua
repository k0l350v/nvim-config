local M = {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	opts = function()
		local opts = {
			theme = 'doom',
			config = {
				center = {
					{ action = 'ene | startinsert', desc = 'New file', icon = ' ', key = 'e' },
					{ action = 'qa', desc = 'Quit', icon = ' ', key = 'q' },
				},
				footer = function()
					local stats = require('lazy').stats()
					local ms = math.floor((stats.startuptime * 100 + 0.5) / 100)
					return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
				end,
			},
		}

		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == 'lazy' then
			vim.cmd.close()
			vim.api.nvim_create_autocmd('User', {
				pattern = 'DashboardLoaded',
				callback = function()
					require('lazy').show()
				end,
			})
		end

		return opts
	end,
}

return M
