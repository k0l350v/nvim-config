local M = {
	'gelguy/wilder.nvim',
	dependencies = {
		{ 'romgrk/fzy-lua-native' },
		{ 'nvim-web-devicons' },
	},
	keys = { ':', '/', '?' },
}

function M.config()
	local wilder = require('wilder')

	wilder.setup({
		modes = { ':', '/', '?' },
		next_key = '<C-n>',
		previous_key = '<C-p>',
	})

	wilder.set_option('pipeline', wilder.branch(
		wilder.substitute_pipeline({
			pipeline = wilder.python_search_pipeline {
				skip_cmdtype_check = 1,
				pattern = wilder.python_fuzzy_pattern {
					start_at_boundary = 0,
				},
			},
		}),
		wilder.cmdline_pipeline({
			fuzzy = 2,
			fuzzy_filter = wilder.lua_fzy_filter(),
		}),
		{
			wilder.check(function(_, x)
				return x == ''
			end),
			wilder.history(),
		},
		wilder.python_search_pipeline {
			pattern = wilder.python_fuzzy_pattern {
				start_at_boundary = 0,
			},
		}
	))

	wilder.set_option('renderer', wilder.popupmenu_renderer(
		wilder.popupmenu_palette_theme({
			border = 'rounded',
			prompt_position = 'top',

			highlighter = wilder.lua_fzy_highlighter(),

			left = { ' ', wilder.popupmenu_devicons() },
			right = { ' ', wilder.popupmenu_scrollbar() },
		})
	))

end

return M
