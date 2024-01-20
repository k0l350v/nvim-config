local M = {
	{ 'MunifTanjim/nui.nvim' },
	{
		'stevearc/dressing.nvim',
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require('lazy').load({ plugins = { 'dressing.nvim' } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require('lazy').load({ plugins = { 'dressing.nvim' } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		dependencies = {
			'nui.nvim',
			'nvim-notify',
		},
		opts = {
			lsp = { progress = { enabled = false }},
			views = {
				cmdline_popup = {
					position = {
						row = vim.o.lines / 2,
						col = "50%",
					},
				},
				cmdline_popupmenu = {
					position = {
						row = vim.o.lines / 2 + 3,
						col = "50%",
					},
				},
			},
			presets = {
				command_palette = true,
			}
		},
	}
}

return M
