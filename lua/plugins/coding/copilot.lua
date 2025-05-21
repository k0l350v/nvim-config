local M = {
	{
		'zbirenbaum/copilot.lua',
		lazy = false,
		cmd = 'Copilot',
		build = ':Copilot auth',
		opts = {
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = '<M-p>',
					jump_next = '<M-n>',
					accept = '<CR>',
					refresh = 'gr',
					open = '<M-CR>',
				},
				layout = {
					position = 'right', -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = false,
				debounce = 75,
				keymap = {
					accept = '<M-y>',
					accept_word = '<M-l>',
					accept_line = false,
					next = '<M-n>',
					prev = '<M-p>',
					dismiss = '<M-e>',
				},
			},
			filetypes = { -- enable all (maybe need disable something)
				['*'] = true,
				['.'] = true,
			},
		},
	},
	{
		'yetone/avante.nvim',
		optional = true,
		opts = {
			provider = 'copilot',
			auto_suggestions_provider = 'copilot',
		},
	},
}

return M
