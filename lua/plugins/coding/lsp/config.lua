local M = {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		{ 'folke/neodev.nvim', opts = { experimental = { pathStrict = true } } },

		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'telescope.nvim',
	},
	opts = {},
}

local default_keys = {
	{
		'gd',
		function()
			require('telescope.builtin').lsp_definitions({ reuse_win = true })
		end,
		desc = 'Goto Definition',
	},
	{ 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'References' },
	{ 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
	{
		'gI',
		function()
			require('telescope.builtin').lsp_implementations({ reuse_win = true })
		end,
		desc = 'Goto Implementation',
	},
	{
		'gy',
		function()
			require('telescope.builtin').lsp_type_definitions({ reuse_win = true })
		end,
		desc = 'Goto T[y]pe Definition',
	},
	{ 'K', vim.lsp.buf.hover, desc = 'Hover' },
	{ 'gK', vim.lsp.buf.signature_help, desc = 'Signature Help' },
	{ '<c-k>', vim.lsp.buf.signature_help, mode = 'i', desc = 'Signature Help' },
	{ 'ga', vim.lsp.buf.code_action, desc = 'Goto Code Action', mode = { 'n', 'v' } },
}

local function attach_keymaps(keymaps, buffer)
	local Keys = require("lazy.core.handler.keys")
	keymaps = Keys.resolve(keymaps)

	for _, keys in pairs(keymaps) do
		local opts = Keys.opts(keys)
		opts.buffer = buffer
		vim.keymap.set(keys.mode or 'n', keys.lhs, keys.rhs, opts)
	end
end

local function get_server_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	return vim.lsp.protocol.make_client_capabilities()
end

local function get_setup_handler(opts)
	local handler = function(server)
		local server_opts = vim.tbl_deep_extend('force', {
			capabilities = get_server_capabilities(),
		}, opts.servers[server] or {})

		if opts.setup[server] then
			if opts.setup[server](server, server_opts) then
				return
			end
		end
		require('lspconfig')[server].setup(server_opts)
	end

	return handler
end

function M.config(_, opts)
	vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(args)
			attach_keymaps(default_keys, args.buf)
		end,
	})

	local ensure_installed_servers = {}
	for server, _ in pairs(opts.servers) do
		ensure_installed_servers[#ensure_installed_servers+1] = server
	end

	local mlsp = require('mason-lspconfig')
	mlsp.setup({ ensure_installed = ensure_installed_servers })
	mlsp.setup_handlers({ get_setup_handler(opts) })
end

return M
