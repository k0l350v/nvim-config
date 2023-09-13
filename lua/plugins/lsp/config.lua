local M = {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		{ 'folke/neodev.nvim', opts = { experimental = { pathStrict = true } } },
		{
			'j-hui/fidget.nvim',
			tag = 'legacy',
			event = 'LspAttach',
			opts = { window = { blend = 0 } }
		},

		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	}
}

local ensure_installed_servers = {
	'lua_ls',
}

local function get_server_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	return vim.lsp.protocol.make_client_capabilities()
end

function M.config(_, opts)
	local function setup(server)
		local server_opts = vim.tbl_deep_extend('force', {
			capabilities = get_server_capabilities()
		}, opts.servers[server] or {})

		if opts.setup[server] then
			if opts.setup[server](server, server_opts) then
				return
			end
		end
		require('lspconfig')[server].setup(server_opts)
	end

	for server, _ in pairs(opts.servers) do
		ensure_installed_servers[#ensure_installed_servers+1] = server
	end

	local mlsp = require('mason-lspconfig')
	mlsp.setup({ ensure_installed = ensure_installed_servers })
	mlsp.setup_handlers({ setup })
end

return M
