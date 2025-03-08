local M = {
	{
		'folke/snacks.nvim',
		opts = {
			picker = {},
		},
		keys = {
			{ '<leader>fs', function() Snacks.picker.smart() end, desc = 'Find smart mode' },

			{ '<leader>fR', function() Snacks.picker.resume() end, desc = 'Find resume' },
			{ '<leader>fr', function() Snacks.picker.recent() end, desc = 'Find recent files' },


			{ '<leader>ff', function() Snacks.picker.files() end, desc = 'Find files' },
			{
				'<leader>fF',
				function()
					Snacks.picker.files({ hidden = true, ignored = true })
				end,
				desc = 'Find files (no ignore)',
			},

			{ '<leader>fw', function() Snacks.picker.grep_word() end, desc = 'Find word from cursor' },

			{ '<leader>/', function() Snacks.picker.grep() end, desc = 'Find string (Grep)' },
			{ '<leader>F', function() Snacks.picker.grep({ hidden = true, ignored = true }) end, desc = 'Find string (Grep no ignore)' },

			{ '<leader>:', function() Snacks.picker.command_history() end, desc = 'Find in command history' },
		},
	},
	{
		'mini.starter',
		dependencies = {
			{ 'folke/snacks.nvim' },
		},
		optional = true,
		opts = function(_, opts)
			local section_name = ' Find'
			local items = {
				{
					action = function()
						Snacks.picker.files()
					end,
					name = 'Find File',
					section = section_name,
				},
				{
					action = function()
						Snacks.picker.recent()
					end,
					name = 'Recent Files',
					section = section_name,
				},
				{
					action = function()
						Snacks.picker.grep()
					end,
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
