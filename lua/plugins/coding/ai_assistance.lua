local M = {
	{
		'olimorris/codecompanion.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
		},
		cmd = {
			'CodeCompanion',
			'CodeCompanionChat',
			'CodeCompanionActions',
			'CodeCompanionAdd',
		},
		init = function()
			vim.g.codecompanion_auto_tool_mode = true
			vim.cmd([[cab cc CodeCompanion]])
			vim.cmd([[cab ccc CodeCompanionChat]])
		end,
		keys = {
			{ '<leader>aA', ':CodeCompanionChat Add<cr>', mode = { 'v' }, desc = 'Code Companion Add' },
			{ '<leader>aa', ':CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'Code Companion Actions' },
			{ '<leader>ac', ':CodeCompanionChat<cr>', mode = { 'n', 'v' }, desc = 'Code Companion Chat' },
			{ '<leader>ai', ':CodeCompanion<cr>', mode = { 'n', 'v' }, desc = 'Code Companion Inline Prompt' },
		},
		opts = {
			opts = {
				language = 'Russian',
			},
			strategies = {
				chat = {
					roles = {
						user = '',
						llm = function(adapter)
							return ' ' .. adapter.formatted_name
						end,
					},
					tools = {
						opts = {
							auto_submit_errors = true,
							auto_submit_success = true,
						},
					},
				},
			},
			adapters = {
				copilot = function()
					return require('codecompanion.adapters').extend('copilot', {
						schema = { model = { default = 'claude-3.7-sonnet' } },
					})
				end,
				copilot_inline = function()
					return require('codecompanion.adapters').extend('copilot', {
						schema = { model = { default = 'claude-3.7-sonnet' } },
					})
				end,
			},
			display = {
				diff = { enabled = false },
				chat = {
					show_header_separator = false,
					show_settings = true,
				},
				action_palette = { provider = 'default' },
			},
		},
		config = function(_, opts)
			require('codecompanion').setup(opts)
		end,
	},
}

return M
