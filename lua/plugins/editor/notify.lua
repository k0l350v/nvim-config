local M = {
	{
		'rcarriga/nvim-notify',
		event = 'VeryLazy',
		opts = {
			timeout = 5000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
			background_colour = '#000000',
			fps = 120,
			stages = 'fade_in_slide_out',
		},
		init = function()
			vim.notify = require('notify')
		end,
	},
	{
		'catppuccin',
		opts = {
			integrations = {
				notify = true,
			},
		},
	},
}

return M
