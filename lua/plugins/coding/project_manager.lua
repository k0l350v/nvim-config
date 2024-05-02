local M = {
	{
		'ahmedkhalf/project.nvim',
		dependecies = {
			'telescope.nvim',
		},
		opts = {
			manual_mode = true,
			patterns = { ".git", "Makefile", "CMakeList.txt", '.venv' },
		},
		event = 'VeryLazy',
		config = function(_, opts)
			require('project_nvim').setup(opts)
			require('telescope').load_extension('projects')
		end,
		keys = {
			{ '<leader>fp', '<Cmd>Telescope projects<CR>', desc = 'Find Projects' },
		},
	},
}

return M
