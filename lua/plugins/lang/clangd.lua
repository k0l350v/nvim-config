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
		'neovim/nvim-lspconfig',
		dependencies = { 'p00f/clangd_extensions.nvim' },
		opts = {
			servers = {
				clangd = {
					-- TODO
				},
			},
			setup = {
				clangd = function(_, opts)
					local clangd_ext_opts = {
						inlay_hints = {
							inline = false,
						},
					}

					require('clangd_extensions').setup(vim.tbl_deep_extend('force', clangd_ext_opts, { server = opts }))
					return false
				end,
			},
		},
	},
	{
		'nvim-cmp',
		opts = function(_, opts)
			table.insert(opts.sorting.comparators, 1, require('clangd_extensions.cmp_scores'))
		end,
	},
}

return M
