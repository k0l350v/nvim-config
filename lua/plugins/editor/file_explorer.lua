local M = {
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'nui.nvim',
			'nvim-lua/plenary.nvim'
		},
		cmd = 'Neotree',
		keys = {
			{
				'<leader>fe',
				function()
					require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = 'Toggle File Explorer window(cwd)',
			}
		},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == 'directory' then
					require('neo-tree')
				end
			end
		end,
		opts = {}
	},
	{
		'echasnovski/mini.files',
		opts = {
			windows = {
				preview = true,
				width_focus = 50,
				width_preview = 50,
			},
			optioons = {
				use_as_default_explorer = false,
			}
		},
		keys = {
			{
				'<leader>fm',
				function()
					require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = 'Open File Manager (current file directory)',
			}
		},
	}
}

return M
