local M = {
	{
		'zbirenbaum/copilot.lua',
		lazy = false,
		cmd = 'Copilot',
		build = ':Copilot auth',
		opts = {
			panel = {
				enabled = false,
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
			filetypes = {
				['*'] = true,
				['.'] = true,
			},
		},
	},
}

return M
