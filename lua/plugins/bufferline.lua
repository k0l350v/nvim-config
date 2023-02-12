local M = {
	'akinsho/bufferline.nvim',
	event = 'VeryLazy',
	opts = {
		options = {
			diagnostics = 'nvim_lsp',
			always_show_bufferline = false,
			close_icon = '',
			show_buffer_close_icons = false,
			show_close_icons = false,
			offsets = {
				{
					filetype = 'neo-tree',
				}
			}
		}
	}
}

return M
