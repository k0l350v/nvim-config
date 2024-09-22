local M = {
	{
		'b0o/incline.nvim',
		event = 'BufEnter',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		opts = {
			render = function(props)
				local unfocused = 'NonText'
				local focused = 'Identifier'
				local color = props.focused and focused or unfocused

				local filename = vim.fn.fnamemodify(vim.fn.bufname(props.buf), ':t')

				local filetype_icon, filetype_color = require('nvim-web-devicons').get_icon_color(filename)
				local icon = props.focused and { filetype_icon, guifg = filetype_color }
					or { filetype_icon, group = unfocused }

				return {
					{ icon },
					{ filetype_icon and ' ' or '' },
					{ filename, group = color },
				}
			end,
		},
	},
	{
		'Bekaboo/dropbar.nvim',
		event = 'BufEnter',
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		keys = {
			{
				'<leader>sp',
				function()
					require('dropbar.api').pick()
				end,
				desc = 'Pick symbol from dropbar',
			},
		},
		opts = {},
	},
}

return M
