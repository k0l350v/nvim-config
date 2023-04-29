local M = {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		{ 'folke/neodev.nvim', opts = { experimental = { pathStrict = true } } },
		{ 'j-hui/fidget.nvim', opts = { window = { blend = 0 } } },

		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	}
}

local ensure_installed_servers = {
	'lua_ls',
	'clangd',
}

local function get_server_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	return vim.lsp.protocol.make_client_capabilities()
end

local function server_setup_handler(server)
	local has_custom_opts, custom_opts = pcall(require, 'plugins/lsp/configs/' .. server)
	local server_opts = has_custom_opts and custom_opts or {}
	server_opts.capabilities = get_server_capabilities()

	require('lspconfig')[server].setup(server_opts)
end

function M.config()
	local mlsp = require('mason-lspconfig')
	mlsp.setup({ ensure_installed = ensure_installed_servers })
	mlsp.setup_handlers({ server_setup_handler })
end

return M
