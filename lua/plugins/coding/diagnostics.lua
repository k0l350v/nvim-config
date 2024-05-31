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
}

return M
