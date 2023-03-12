local M = {
	'akinsho/bufferline.nvim',
	dependencies = { 'catppuccin' },
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

function M.config(_, opts)
	if vim.g.colors_name == 'catppuccin' then
		opts.highlights = require('catppuccin.groups.integrations.bufferline').get()
	end

	require('bufferline').setup(opts)
end

return M
