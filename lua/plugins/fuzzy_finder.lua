local M = {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	version = false,
	dependencies = {
		{ 'plenary.nvim' },
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			config = function()
				require('telescope').load_extension('fzf')
			end
		},
	},
	opts = {
		defaults = {
			layout_strategy = 'horizontal',
			layout_config = { prompt_position = 'top' },
			sorting_strategy = 'ascending',
			winblend = 0,
			prompt_prefix = " ",
			selection_caret = " ",
			mappings = {
				n = {
					['q'] = function(...)
						return require('telescope.actions').close(...)
					end,
				}
			},
		}
	}
}

return M
