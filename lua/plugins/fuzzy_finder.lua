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
	keys = {
		{ '<leader>fr', '<cmd>Telescope resume<cr>', desc = 'Find resume' },
		{ '<leader>fR', '<cmd>Telescope oldfiles<cr>', desc = 'Find recent files' },
		{ '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', desc = 'Find files' },
		{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
		{ '<leader>fw', 'Telescope grep_string hidden=true', desc = 'Find word from cursor' },
		{ '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Find in command history' },
		{ '<leader>/', '<cmd>Telescope live_grep hidden=true<cr>', desc = 'Find string (Grep)' },
	},
	opts = {
		defaults = {
			layout_strategy = 'horizontal',
			layout_config = { prompt_position = 'top' },
			sorting_strategy = 'ascending',
			winblend = 0,
			prompt_prefix = ' ',
			selection_caret = ' ',
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
