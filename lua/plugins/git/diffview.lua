local M = {
	'sindrets/diffview.nvim',
	dependencies = {
		{ 'catppuccin' },
	},
	cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
	keys = {
		{ '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Show changes' },
		{ '<leader>gl', '<cmd>DiffviewFileHistory %<cr>', desc = 'Shows the commit logs for file' },
		{ '<leader>gL', '<cmd>DiffviewFileHistory<cr>', desc = 'Shows the commit logs' },
	},
	opts = {
		hooks = {
			diff_buf_read = function()
				local opt = vim.opt_local
				opt.list = false
				opt.wrap = false
				opt.relativenumber = false
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
