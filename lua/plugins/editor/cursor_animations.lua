local M = {
	'echasnovski/mini.animate',
	event = 'VeryLazy',
	opts = function ()
		local animate = require('mini.animate')
		return {
			resize = {
				timing = animate.gen_timing.linear({ duration = 50, unit = 'total' })
			},
			scroll = { enable = false },
			open = { enable = false },
			close = { enable = false },
		}
	end,
	config = function (_, opts)
		require('mini.animate').setup(opts)
	end
}

return M
