local M = {
	{
		'ahmedkhalf/project.nvim',
		dependencies = {
			{ 'telescope.nvim' },
		},
		opts = {
			manual_mode = true,
			patterns = { '.git', 'Makefile', 'CMakeList.txt', '.venv' },
		},
		config = function(_, opts)
			require('project_nvim').setup(opts)
			require('telescope').load_extension('projects')
		end,
		keys = {
			{ '<leader>fp', '<Cmd>Telescope projects<CR>', desc = 'Find Projects' },
		},
	},
	{
		'mini.starter',
		optional = true,
		dependencies = {
			{ 'project.nvim' },
		},
		opts = function(_, opts)
			local item = {
				action = 'Telescope projects',
				name = 'Projects',
				section = ' Workspace',
			}

			opts.items = opts.items or {}
			table.insert(opts.items, item)
		end,
	},
}

return M
