local M = {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'lua' })
			end
		end,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'folke/neodev.nvim', opts = {} },
		},
		opts = {
			servers = {
				lua_ls = {},
			},
		},
	},
	{
		'stevearc/conform.nvim',
		ft = { 'lua' },
		optional = true,
		dependencies = {
			{
				'williamboman/mason.nvim',
				opts = function(_, opts)
					opts.ensure_installed = opts.ensure_installed or {}
					vim.list_extend(opts.ensure_installed, { 'stylua' })
				end,
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
			},
		},
	},
}

return M
