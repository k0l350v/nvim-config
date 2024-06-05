local M = {
	{
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
				end,
			},
		},
		keys = {
			{ '<leader>fr', '<cmd>Telescope resume<cr>', desc = 'Find resume' },
			{ '<leader>fR', '<cmd>Telescope oldfiles<cr>', desc = 'Find recent files' },
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
			{ '<leader>fF', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>', desc = 'Find files (no ignore)' },
			{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
			{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
			{ '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = 'Find word from cursor' },

			{ '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Find in command history' },
			{ '<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Find string (Grep)' },
			{ '<leader>F', '<cmd>Telescope live_grep<cr>', desc = 'Find string (Grep no ignore)' },
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
					i = {
						['<C-q>'] = function(...)
							return require('telescope.actions').close(...)
						end,
					},
					n = {
						['q'] = function(...)
							return require('telescope.actions').close(...)
						end,
					},
				},
			},
		},
	},
	{
		'mini.starter',
		dependencies = {
			{ 'telescope.nvim' },
		},
		optional = true,
		opts = function(_, opts)
			local section_name = ' Telescope'
			local items = {
				{
					action = 'Telescope find_files',
					name = 'Find File',
					section = section_name,
				},
				{
					action = 'Telescope oldfiles',
					name = 'Recent Files',
					section = section_name,
				},
				{
					action = 'Telescope live_grep',
					name = 'Grep Text',
					section = section_name,
				},
			}

			opts.items = opts.items or {}
			vim.list_extend(opts.items, items)
		end,
	},
}

return M
