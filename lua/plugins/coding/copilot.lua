local M = {
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		build = ':Copilot auth',
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		'nvim-cmp',
		dependencies = {
			{
				'zbirenbaum/copilot-cmp',
				dependencies = 'copilot.lua',
				opts = {},
				config = function(_, opts)
					local copilot_cmp = require('copilot_cmp')
					copilot_cmp.setup(opts)

					vim.api.nvim_create_autocmd('LspAttach', {
						callback = function(args)
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							if client.name == 'copilot' then
								copilot_cmp._on_insert_enter({})
							end
						end,
					})
				end,
			},
		},
		opts = function(_, opts)
			table.insert(opts.sources, 1, {
				name = 'copilot',
				group_index = 1,
				priority = 100,
				max_item_count = 3,
			})
		end,
	},
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		version = 'canary',
		dependencies = {
			{ 'zbirenbaum/copilot.lua' },
			{ 'nvim-lua/plenary.nvim' },
		},
		event = 'VeryLazy',
		opts = function()
			local prompts = require('prompts')

			local staged = function()
				local cmd = 'git diff --no-color --no-ext-diff --staged'
				local selection = {}
				selection.filetype = 'diff'
				selection.lines = ''

				local handle = io.popen(cmd)
				if handle then
					selection.lines = handle:read('*a')
					handle:close()
				end

				return selection
			end

			return {
				debug = false,

				model = 'gpt-4',
				temperature = 0.1,
				system_prompt = prompts.system,

				question_header = '👤 User',
				answer_header = '🤖 Copilot',
				error_header = '❌ Error',
				separator = ' ',

				show_folds = false,
				show_help = false,

				context = 'buffers',
				prompts = {
					Explain = {
						prompt = prompts.explain,
					},
					Review = {
						system_prompt = table.concat({ prompts.system, prompts.review }, '\n'),
						prompt = 'Review the selected code.',
						callback = nil, -- TODO: add nvim diagnostics parsing
					},
					CommitReview = {
						system_prompt = table.concat({ prompts.system, prompts.review }, '\n'),
						prompt = 'Review the selected commit diff.',
						selection = staged,
					},
					CommitMessage = {
						prompt = 'Generate a commit message for selected code.',
						selection = staged,
					},
					CommitMessageEng = {
						prompt = 'Generate a commit message for selected code in english.',
						selection = staged,
					},
				},
			}
		end,
		config = function(_, opts)
			require('CopilotChat').setup(opts)

			vim.api.nvim_create_autocmd('BufEnter', {
				pattern = 'copilot-*',
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
					vim.opt_local.list = false
				end,
			})
		end,
		keys = function()
			local chat = require('CopilotChat')
			local select = require('CopilotChat.select')
			local actions = require('CopilotChat.actions')
			local telescope = require('CopilotChat.integrations.telescope')

			return {
				{ '<leader>at', mode = { 'n' }, '<cmd>CopilotChatToggle<cr>', desc = 'CopilotChat - Toggle' },
				-- in visual mode reopen chat for update selection
				{ '<leader>at', mode = { 'v' }, '<cmd>CopilotChatOpen<cr>', desc = 'CopilotChat - Toggle' },
				{
					'<leader>ah',
					function()
						telescope.pick(actions.help_actions())
					end,
					mode = { 'n', 'v' },
					desc = 'CopilotChat - Help actions',
				},
				{
					'<leader>ap',
					function()
						telescope.pick(actions.prompt_actions())
					end,
					mode = { 'n', 'v' },
					desc = 'CopilotChat - Help actions',
				},
				{
					'<leader>ae',
					'<cmd>CopilotChatExplain<cr>',
					mode = { 'n', 'v' },
					desc = 'CopilotChat - Explain code',
				},
				{
					'<leader>ar',
					'<cmd>CopilotChatReview<cr>',
					mode = { 'n', 'v' },
					desc = 'CopilotChat - Review code',
				},
				{
					'<leader>acr',
					'<cmd>CopilotChatCommitReview<cr>',
					desc = 'CopilotChat - Review commit changes',
				},
				{ '<leader>acm', '<cmd>CopilotChatCommitMessage<cr>', desc = 'CopilotChat - Fix Diagnostic' },
				{ '<leader>acM', '<cmd>CopilotChatCommitMessageEng<cr>', desc = 'CopilotChat - Fix Diagnostic' },
			}
		end,
	},
	{
		'folke/edgy.nvim',
		optional = true,
		opts = function(_, opts)
			opts.right = opts.right or {}
			table.insert(opts.right, {
				ft = 'copilot-chat',
				title = 'CopilotChat',
				open = 'CopilotChatToggle',
				size = { width = 0.40 },
			})
		end,
	},
}

return M
