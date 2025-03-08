local M = {
	{
		'folke/snacks.nvim',
		keys = {
			{
				'<leader>fp',
				function()
					Snacks.picker.projects()
				end,
				desc = 'Find Projects',
			},
		},
	},
	{
		'mini.starter',
		optional = true,
		dependencies = {
			{ 'snacks.nvim' },
		},
		opts = function(_, opts)
			local item = {
				action = function()
					Snacks.picker.projects()
				end,
				name = 'Projects',
				section = ' Workspace',
			}

			opts.items = opts.items or {}
			table.insert(opts.items, item)
		end,
	},
}

return M
