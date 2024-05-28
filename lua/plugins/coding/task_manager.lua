local M = {
	{
		'stevearc/overseer.nvim',
		keys = {
			{ '<leader>tt', '<cmd>OverseerToggle<cr>', desc = 'Toggle Task Window' },
			{ '<leader>tq', '<cmd>OverseerQuickAction<cr>', desc = 'Last Task Quick Action' },
		},
		opts = {
			task_list = {
				direction = 'bottom',
			},
			component_aliases = {
				default = {
					{ 'display_duration', detail_level = 1 },
					{ 'on_complete_dispose', timeout = 900 },
					'on_exit_set_status',
				},
			},
		},
		config = function(_, opts)
			local problem_matcher = require('overseer.template.vscode.problem_matcher')

			opts.problem_matchers = opts.problem_matchers or {}
			for name, matcher in pairs(opts.problem_matchers) do
				problem_matcher.register_problem_matcher(name, matcher)
			end

			require('overseer').setup(opts)
		end,
	},
	{
		'folke/edgy.nvim',
		optional = true,
		opts = function(_, opts)
			opts.left = vim.list_extend(opts.left or {}, {
				{
					title = 'Overseer',
					ft = 'OverseerList',
					open = 'OverseerToggle!',
					size = { width = 40 },
				},
			})
			opts.bottom = vim.list_extend(opts.bottom or {}, {
				{
					title = 'Overseer',
					ft = '',
					filter = function(buf)
						return vim.b[buf].overseer_task ~= nil
					end,
					size = { height = 0.30 },
				},
			})
		end,
	},
}

return M
