local M = {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
		'nvim-lua/plenary.nvim'
	},
	cmd = 'Neotree',
	keys = {
		{
			'<leader>fe',
			function()
				require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = 'Toggle File Explorer (cwd)',
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
}

return M
