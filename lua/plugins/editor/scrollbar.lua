local M = {
	'petertriho/nvim-scrollbar',
	event = 'BufReadPost',
	opts = {
		excluded_filetypes = { 'prompt', 'neo-tree', 'TelescopePrompt' },
		handle = {
			blend = 65,
			highlight = 'Cursor',
			hide_if_all_visible = true,
		},
		handlers = {
			cursor = false
		}
	}
}

return M
