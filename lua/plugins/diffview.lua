local M = {
	'sindrets/diffview.nvim',
	dependencies = {
		{ 'catppuccin' },
	},
	cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
	keys = {
		{ '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'DiffView' }
	},
	opts = {
		hooks = {
			diff_buf_read = function()
				local opt = vim.opt_local
				opt.list = false
				opt.wrap = false
				opt.relativenumber = false

				opt.fillchars:append('diff:╱')
			end,

			diff_buf_win_enter = function(_, _, ctx)
				if ctx.layout_name:match('^diff2') then
					if ctx.symbol == 'a' then
						vim.opt_local.winhl = table.concat({
							'DiffAdd:DiffViewDelete',
							'DiffChange:DiffViewDelete',
							'DiffDelete:Comment',
							'DiffText:DiffViewTextDelete',
						}, ',')
					elseif ctx.symbol == 'b' then
						vim.opt_local.winhl = table.concat({
							'DiffAdd:DiffViewAdd',
							'DiffDelete:Comment',
							'DiffChange:DiffViewAdd',
							'DiffText:DiffViewTextAdd',
						}, ',')
					end
				end
			end,
		},
	}
}

return M
