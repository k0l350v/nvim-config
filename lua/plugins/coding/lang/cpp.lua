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
						'--clang-tidy',
						'--header-insertion=iwyu',
						'--completion-style=detailed',
						'--function-arg-placeholders=true',
					},
					init_options = {
						clangdFileStatus = true,
					},
					capabilities = {
						offsetEncoding = { 'utf-16' },
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
	{
		'mfussenegger/nvim-dap',
		optional = true,
		dependencies = {
			'williamboman/mason.nvim',
			optional = true,
			opts = function(_, opts)
				if type(opts.ensure_installed) == 'table' then
					vim.list_extend(opts.ensure_installed, { 'codelldb' })
				end
			end,
		},
		opts = function()
			local dap = require('dap')
			if not dap.adapters['codelldb'] then
				require('dap').adapters['codelldb'] = {
					type = 'server',
					host = 'localhost',
					port = '${port}',
					executable = {
						command = 'codelldb',
						args = {
							'--port',
							'${port}',
						},
					},
				}
			end

			for _, lang in ipairs({ 'c', 'cpp' }) do
				dap.configurations[lang] = {
					{
						type = 'codelldb',
						request = 'launch',
						name = 'Launch file',
						program = function()
							return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
						end,
						cwd = '${workspaceFolder}',
					},
					{
						type = 'codelldb',
						request = 'attach',
						name = 'Attach to process',
						processId = require('dap.utils').pick_process,
						cwd = '${workspaceFolder}',
					},
				}
			end

			dap.listeners.after.event_initialized['no-cpp-except-brkpt'] = function(session)
				if session.config.type == 'codelldb' then
					require('dap.repl').execute('breakpoint name configure --disable cpp_exception')
				end
			end
		end,
	},
}

return M
