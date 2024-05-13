local M = {
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		build = ':Copilot auth',
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		'nvim-cmp',
		dependencies = {
			{
				'zbirenbaum/copilot-cmp',
				dependencies = 'copilot.lua',
				opts = {},
				config = function(_, opts)
					local copilot_cmp = require('copilot_cmp')
					copilot_cmp.setup(opts)

					vim.api.nvim_create_autocmd('LspAttach', {
						callback = function(args)
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							if client.name == 'copilot' then
								copilot_cmp._on_insert_enter({})
							end
						end,
					})
				end,
			},
		},
		opts = function(_, opts)
			table.insert(opts.sources, 1, {
				name = 'copilot',
				group_index = 1,
				priority = 100,
				max_item_count = 3,
			})
		end,
	},
}

return M
