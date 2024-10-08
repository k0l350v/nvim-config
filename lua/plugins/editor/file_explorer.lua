local M = {
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'nui.nvim',
			'nvim-lua/plenary.nvim',
		},
		cmd = 'Neotree',
		keys = {
			{
				'<leader>fe',
				function()
					require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = 'Toggle File Explorer window(cwd)',
			},
		},
		init = function()
			vim.api.nvim_create_autocmd('BufEnter', {
				group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
				desc = 'Start Neo-tree with directory',
				once = true,
				callback = function()
					if package.loaded['neo-tree'] then
						return
					else
						---@diagnostic disable-next-line: param-type-mismatch
						local stats = vim.uv.fs_stat(vim.fn.argv(0))
						if stats and stats.type == 'directory' then
							require('neo-tree')
						end
					end
				end,
			})
		end,
		opts = {
			enable_diagnostics = false,
			enable_git_status = false,
			sources = { 'filesystem' },
			filesystem = {
				follow_current_file = { enabled = true },
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = '',
					expander_expanded = '',
					indent_marker = '│',
					last_indent_marker = '╰',
				},
				icon = {
					folder_closed = ' ',
					folder_open = ' ',
					folder_empty = ' ',
				},
				modified = {
					symbol = ' ',
				},
			},
		},
	},
	{
		'folke/edgy.nvim',
		optional = true,
		ft = 'neo-tree',
		opts = function(_, opts)
			opts.left = vim.list_extend(opts.left or {}, {
				{
					title = 'Neo-Tree',
					ft = 'neo-tree',
				},
			})
		end,
	},
}

return M
