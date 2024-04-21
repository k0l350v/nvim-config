local M = {
	'stevearc/overseer.nvim',
	keys = {
		{ '<leader>ot', '<cmd>OverseerToggle<cr>', desc = 'Overseer Toggle' },
		{ '<leader>oq', '<cmd>OverseerQuickAction<cr>', desc = 'Overseer Quick Action' },
	},
	opts = {
		task_list = {
			direction = 'bottom',
			max_width = 0.4,
			max_height = 0.6,
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
}

return M
