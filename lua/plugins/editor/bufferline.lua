local M = {
	{
		'akinsho/bufferline.nvim',
		dependencies = {
			{ 'catppuccin' },
			{ 'tiagovla/scope.nvim', opts = {} },
			{ 'famiu/bufdelete.nvim' },
		},
		event = 'VeryLazy',
		opts = {
			options = {
				diagnostics = 'nvim_lsp',
				always_show_bufferline = true,
				close_icon = '',
				show_buffer_close_icons = false,
				show_close_icons = false,
				offsets = {
					{
						filetype = 'neo-tree',
					},
				},
			},
		},
		keys = {
			{ '<C-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
			{ '<C-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous buffer' },
			{ '<leader><C-l>', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer right' },
			{ '<leader><C-h>', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer left' },

			{
				'<leader><tab>l',
				function()
					vim.cmd.tabnext()
				end,
				desc = 'Next tab',
			},
			{
				'<leader><tab>h',
				function()
					vim.cmd.tabprevious()
				end,
				desc = 'Previous tab',
			},
			{
				'<leader><tab>n',
				function()
					vim.cmd.tabnew()
				end,
				desc = 'New tab',
			},
			{
				'<leader><tab>c',
				function()
					vim.cmd.tabclose()
				end,
				desc = 'Delete tab',
			},

			{
				'<C-w>d',
				function()
					require('bufdelete').bufdelete(0, true)
				end,
				desc = 'Close buffer',
			},
			{ '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Pin buffer' },
			{ '<leader>bs', '<cmd>BufferLinePick<cr>', desc = 'Select buffer from bufferline' },
			{ '<leader>bS', '<cmd>BufferLinePickClose<cr>', desc = 'Close selected buffer from bufferline' },
			{ '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', desc = 'Close all buffers to the left' },
			{ '<leader>bl', '<cmd>BufferLineCloseRight<cr>', desc = 'Close all buffers to the right' },
			{
				'<leader>bo',
				'<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>',
				desc = 'Close other buffers',
			},
		},
		config = function(_, opts)
			if vim.g.colors_name == 'catppuccin' then
				opts.highlights = require('catppuccin.groups.integrations.bufferline').get()
			end

			require('bufferline').setup(opts)
		end,
	},
	{
		'folke/snacks.nvim',
		keys = {
			{
				'<leader>fb',
				function()
					Snacks.picker.buffers()
				end,
				desc = 'Find buffers',
			},
			{
				'<leader>fB',
				function()
					Snacks.picker.buffers({ hidden = true, nofile = true })
				end,
			}
		},
	},
}

return M
