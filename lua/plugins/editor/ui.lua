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
			routes = {
				{
					opts = { skip = true },
					filter = {
						event = 'msg_show',
						any = {
							{ find = '%d+L, %d+B' },
							{ find = '; after #%d+' },
							{ find = '; before #%d+' },
							{ kind = '', max_height = 1, find = '^[/?].+' }, -- msg after pattern not found
						},
					},
				},
			},
			lsp = { progress = { enabled = true } },
			views = {
				cmdline_popup = {
					position = {
						row = vim.o.lines / 2,
						col = '50%',
					},
				},
				cmdline_popupmenu = {
					position = {
						row = vim.o.lines / 2 + 3,
						col = '50%',
					},
				},
			},
			presets = {
				command_palette = true,
			},
		},
	},
	{
		'catppuccin',
		opts = {
			integrations = {
				noice = true,
			},
		},
	},
}

return M
