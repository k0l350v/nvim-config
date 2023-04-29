local M = {
	'petertriho/nvim-scrollbar',
	event = 'BufReadPost',
	opts = {
		handle = {
			blend = 65,
			highlight = 'Cursor',
			hide_if_all_visible = false
		},
		handlers = {
			cursor = false
		}
	}
}

return M
