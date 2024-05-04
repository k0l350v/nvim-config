local logo = table.concat({
	'██╗  ██╗ █████╗ ██╗     ██████╗ ███████╗ █████╗ ██╗   ██╗',
	'██║ ██╔╝██╔══██╗██║     ╚════██╗██╔════╝██╔══██╗██║   ██║',
	'█████═╝ ██║  ██║██║      █████╔╝██████╗ ██║  ██║╚██╗ ██╔╝',
	'██╔═██╗ ██║  ██║██║      ╚═══██╗╚════██╗██║  ██║ ╚████╔╝ ',
	'██║ ╚██╗╚█████╔╝███████╗██████╔╝██████╔╝╚█████╔╝  ╚██╔╝  ',
	'╚═╝  ╚═╝ ╚════╝ ╚══════╝╚═════╝ ╚═════╝  ╚════╝    ╚═╝   ',
}, '\n')

local M = {
	{
		'echasnovski/mini.starter',
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = 'VimEnter',
		opts = {
			evaluate_single = true,
			silent = true,
			header = logo,
		},
		config = function(_, opts)
			-- close Lazy and re-open when starter is ready
			if vim.o.filetype == 'lazy' then
				vim.cmd.close()
				vim.api.nvim_create_autocmd('User', {
					pattern = 'MiniStarterOpened',
					callback = function()
						require('lazy').show()
					end,
				})
			end

			local starter = require('mini.starter')

			opts.items = opts.items or {}
			local builtin_section = ' Built-in'
			local builtin_actions = {
				{ name = 'Edit new buffer', action = 'enew', section = builtin_section },
				{ name = 'Quit Neovim', action = 'qall', section = builtin_section },
			}
			vim.list_extend(opts.items, builtin_actions)

			opts.content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.aligning('center', 'center'),
			}

			starter.setup(opts)

			vim.api.nvim_create_autocmd('User', {
				pattern = 'LazyVimStarted',
				callback = function()
					local stats = require('lazy').stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					starter.config.footer = '⚡ Neovim loaded '
						.. stats.loaded
						.. '/'
						.. stats.count
						.. ' plugins'
						.. ' in '
						.. ms
						.. ' ms'
					pcall(starter.refresh)
				end,
			})
		end,
	},
}

return M
