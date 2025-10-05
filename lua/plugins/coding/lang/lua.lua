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
				stylua = { enabled = false },
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
	{
		'mfussenegger/nvim-dap',

		dependencies = {
			{
				'jbyuki/one-small-step-for-vimkind',
				keys = {
					{
						'<leader>daL',
						function()
							require('osv').launch({ port = 8086 })
						end,
						desc = 'Adapter Lua Server',
					},
					{
						'<leader>dal',
						function()
							require('osv').run_this()
						end,
						desc = 'Adapter Lua',
					},
				},
				config = function()
					local dap = require('dap')
					dap.adapters.nlua = function(callback, config)
						callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
					end
					dap.configurations.lua = {
						{
							type = 'nlua',
							request = 'attach',
							name = 'Attach to running Neovim instance',
						},
					}
				end,
			},
		},
	},
}

return M
