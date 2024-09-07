local M = {
	{
		'rcarriga/nvim-dap-ui',
		dependencies = { 'nvim-neotest/nvim-nio' },
		keys = {
			{
				'<leader>du',
				function()
					require('dapui').toggle({})
				end,
				desc = 'Dap UI',
			},
			{
				'<leader>de',
				function()
					require('dapui').eval()
				end,
				desc = 'Eval',
				mode = { 'n', 'v' },
			},
		},
		opts = {
			layouts = {
				{
					elements = {
						{ id = 'stacks', size = 0.7 },
						{ id = 'breakpoints', size = 0.3 },
					},
					position = 'left',
					size = 0.2,
				},
				{
					elements = {
						'scopes',
						'console',
					},
					size = 0.3,
					position = 'bottom',
				},
			},
		},
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		opts = {},
	},
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'nvim-dap-ui',
			'nvim-dap-virtual-text',

			'catppuccin', -- icons hl
		},
		keys = {
			{
				'<leader>dB',
				function()
					require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
				end,
				desc = 'Breakpoint Condition',
			},
			{
				'<leader>db',
				function()
					require('dap').toggle_breakpoint()
				end,
				desc = 'Toggle Breakpoint',
			},
			{
				'<leader>dc',
				function()
					require('dap').continue()
				end,
				dot_repeat = true,
				desc = 'Continue',
			},
			{
				'<leader>dC',
				function()
					require('dap').run_to_cursor()
				end,
				desc = 'Run to Cursor',
			},
			{
				'<leader>dg',
				function()
					require('dap').goto_()
				end,
				desc = 'Go to line (no execute)',
			},
			{
				'<leader>di',
				function()
					require('dap').step_into()
				end,
				dot_repeat = true,
				desc = 'Step Into',
			},
			{
				'<leader>dj',
				function()
					require('dap').down()
				end,
				dot_repeat = true,
				desc = 'Down',
			},
			{
				'<leader>dk',
				function()
					require('dap').up()
				end,
				dot_repeat = true,
				desc = 'Up',
			},
			{
				'<leader>dl',
				function()
					require('dap').run_last()
				end,
				desc = 'Run Last',
			},
			{
				'<leader>dO',
				function()
					require('dap').step_out()
				end,
				dot_repeat = true,
				desc = 'Step Out',
			},
			{
				'<leader>do',
				function()
					require('dap').step_over()
				end,
				dot_repeat = true,
				desc = 'Step Over',
			},
			{
				'<leader>dp',
				function()
					require('dap').pause()
				end,
				desc = 'Pause',
			},
			{
				'<leader>dr',
				function()
					require('dap').repl.toggle()
				end,
				desc = 'Toggle REPL',
			},
			{
				'<leader>ds',
				function()
					require('dap').session()
				end,
				desc = 'Session',
			},
			{
				'<leader>dt',
				function()
					require('dap').terminate()
				end,
				desc = 'Terminate',
			},
			{
				'<leader>dh',
				function()
					require('dap.ui.widgets').hover()
				end,
				desc = 'Widgets',
			},
		},
		config = function()
			local icons = {
				Stopped = { ' ', 'DiagnosticWarn', 'DapStoppedLine' },
				Breakpoint = { '●', 'DapBreakpoint' }, -- DapBreakpoint from catppuccin
				BreakpointCondition = { '●', 'DapBreakpointCondition' }, -- DapBreakpointCondition from catppuccin
				BreakpointRejected = { ' ', 'DiagnosticError' },
				LogPoint = { '.>', 'DapLogPoint' }, -- DapLogPoint from catppuccin
			}

			vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })
			for name, sign in pairs(icons) do
				sign = type(sign) == 'table' and sign or { sign }
				vim.fn.sign_define(
					'Dap' .. name,
					{ text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] }
				)
			end

			local dap = require('dap')
			local dapui = require('dapui')
			dap.listeners.after.event_initialized['dapui_config'] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated['dapui_config'] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited['dapui_config'] = function()
				dapui.close({})
			end
		end,
	},
	{
		'folke/edgy.nvim',
		optional = true,
		opts = function(_, opts)
			opts.left = vim.list_extend(opts.left or {}, {
				{
					ft = 'dapui_stacks',
					wo = { winbar = ' Stacks' },
					size = { width = 0.15 },
					open = function()
						require('dapui').open()
					end,
				},
				{
					ft = 'dapui_breakpoints',
					wo = { winbar = ' Breakpoints' },
					size = { width = 0.15, height = 0.25 },
					open = function()
						require('dapui').open()
					end,
				},
			})

			opts.bottom = vim.list_extend(opts.bottom or {}, {
				{
					ft = 'dap-repl',
					title = 'Debug REPL',
					size = { height = 0.4 },
					open = function()
						require('dapui').open()
					end,
				},
				{
					ft = 'dapui_scopes',
					size = { height = 0.4 },
					open = function()
						require('dapui').open()
					end,
				},
				{
					ft = 'dapui_console',
					title = 'Debug Console',
					size = { height = 0.4 },
					open = function()
						require('dapui').open()
					end,
				},
			})
		end,
	},
}

return M
