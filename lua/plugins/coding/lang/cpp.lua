local M = {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'c', 'cpp' })
			end
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				'clangd',
				'clang-format',
			})
		end,
	},
	{
		'conform.nvim',
		opts = {
			formatters_by_ft = {
				cpp = { 'clang-format' },
			},
		},
	},
	{
		'p00f/clangd_extensions.nvim',
		config = function() end,
		opts = {
			inlay_hints = {
				inline = false,
			},
		},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = { 'p00f/clangd_extensions.nvim' },
		keys = {
			{ '<leader>cR', '<cmd>ClangdSwitchSourceHeader<cr>', desc = 'Switch Source/Header (C/C++)' },
		},
		opts = {
			servers = {
				clangd = {
					cmd = {
						'clangd',
						'--background-index',
						'--suggest-missing-includes',
						'--clang-tidy',
						'--header-insertion=iwyu',
						'--completion-style=detailed',
						'--cross-file-rename',
						'--function-arg-placeholders',
					},
					init_options = {
						clangdFileStatus = true,
					},
				},
			},
			setup = {
				clangd = function(_, opts)
					local plugin = require('lazy.core.config').plugins['clangd_extensions.nvim']
					local clangd_ext_opts = require('lazy.core.plugin').values(plugin, 'opts', false)
					require('clangd_extensions').setup(vim.tbl_deep_extend('force', clangd_ext_opts, { server = opts }))
					return false
				end,
			},
		},
	},
	{
		'nvim-cmp',
		dependencies = { 'p00f/clangd_extensions.nvim' },
		opts = function(_, opts)
			table.insert(opts.sorting.comparators, 1, require('clangd_extensions.cmp_scores'))
		end,
	},
}

return M
