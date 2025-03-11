local M = {
	{
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		keys = {
			{ '<leader>xt', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
			{ '<leader>xT', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
		},
		opts = {},
	},
	{
		'folke/edgy.nvim',
		optional = true,
		opts = function(_, opts)
			for _, pos in ipairs({ 'top', 'bottom', 'left', 'right' }) do
				opts[pos] = opts[pos] or {}
				table.insert(opts[pos], {
					ft = 'trouble',
					filter = function(_, win)
						return vim.w[win].trouble
							and vim.w[win].trouble.position == pos
							and vim.w[win].trouble.type == 'split'
							and vim.w[win].trouble.relative == 'editor'
							and not vim.w[win].trouble_preview
					end,
				})
			end
		end,
	},
	{
		'lualine.nvim',
		opts = function(_, opts)
			local trouble = require('trouble')
			local symbols = trouble.statusline({
				mode = 'lsp_document_symbols',
				groups = {},
				title = false,
				filter = { range = true },
				format = '{kind_icon}{symbol.name:Normal}',
				-- The following line is needed to fix the background color
				-- Set it to the lualine section you want to use
				hl_group = 'lualine_c_normal',
			})

			opts.sections = vim.tbl_deep_extend('force', opts.sections or {}, { lualine_c = {} })
			table.insert(opts.sections.lualine_c, {
				symbols.get,
				cond = symbols.has,
			})
		end,
	},
}

return M
