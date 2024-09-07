local M = {
	{
		'folke/edgy.nvim',
		event = 'VeryLazy',
		opts = {
			animate = {
				enabled = false,
			},
			wo = {
				winbar = false,
			},
			keys = {
				["<A-Up>"] = function(win)
					win:resize("height", 2)
				end,
				["<A-Down>"] = function(win)
					win:resize("height", -2)
				end,
				["<A-Right>"] = function(win)
					win:resize("width", 2)
				end,
				["<A-Left>"] = function(win)
					win:resize("width", -2)
				end,
			}
		},
	},
}

return M
