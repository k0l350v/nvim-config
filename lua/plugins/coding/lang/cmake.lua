local M = {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'cmake' })
			end
		end,
	},
	{
		'mason.nvim',
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { 'cmakelang' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				neocmake = {},
			},
		},
	},
	{
		'overseer.nvim',
		opts = {
			problem_matchers = {
				['$cmake'] = {
					pattern = {
						{
							regexp = '^\\s*CMake (Error|Warning) at (.+):(\\d+)\\s*(.*)?:',
							severity = 1,
							file = 2,
							line = 3,
						},
						{
							regexp = '^\\s+(.*)$',
							message = 1,
						},
					},
				},
			},
		},
	},
	{
		'Civitasv/cmake-tools.nvim',
		dependencies = {
			{ 'overseer.nvim' },
		},
		ft = { 'cmake', 'cpp', 'c' }, -- TODO: remove after resolve https://github.com/Civitasv/cmake-tools.nvim/issues
		cmd = {
			'CMakeGenerate',
			'CMakeClean',
			'CMakeBuild',
			'CMakeInstall',
			'CMakeRun',
			'CMakeRunTest',
			'CMakeDebug',

			'CMakeQuickBuild',
			'CMakeQuickRun',
			'CMakeQuickDebug',

			'CMakeSelectBuildType',
			'CMakeSelectKit',
			'CMakeSelectConfigurePreset',
			'CMakeSelectBuildPreset',
			'CMakeSelectBuildTarget',
			'CMakeSelectLaunchTarget',
		},
		keys = {
			{ '<leader>cg', '<cmd>CMakeGenerate<cr>', desc = 'Cmake Generate' },
			{ '<leader>cb', '<cmd>CMakeBuild<cr>', desc = 'Cmake Build' },
			{ '<leader>cr', '<cmd>CMakeRun<cr>', desc = 'Cmake Run' },
			{ '<leader>cd', '<cmd>CMakeDebug<cr>', desc = 'Cmake Debug' },

			{ '<leader>csg', '<cmd>CMakeSelectConfigurePreset<cr>', desc = 'Cmake Select Configure Preset' },
			{ '<leader>csb', '<cmd>CMakeSelectBuildPreset<cr>', desc = 'Cmake Select Build Preset' },
			{ '<leader>cst', '<cmd>CMakeSelectBuildTarget<cr>', desc = 'Cmake Select Build Target' },
			{ '<leader>csT', '<cmd>CMakeSelectBuildType<cr>', desc = 'Cmake Select Build Type' },
			{ '<leader>csl', '<cmd>CMakeSelectLaunchTarget<cr>', desc = 'Cmake Select Launch Target' },
		},
		opts = {
			cmake_regenerate_on_save = false,
			cmake_build_directory = 'build/${variant:buildType}',
			cmake_soft_link_compile_commands = false,
			cmake_executor = {
				name = 'overseer',
				default_opts = {
					overseer = {
						new_task_opts = {
							strategy = {
								'jobstart',
								use_terminal = false, -- disable for long output
							},
						},
						on_new_task = function(task)
							local get_task_name = function(cmd)
								-- cmake --build
								if cmd:find('%s+%-%-build') then
									-- cmake --build --target clean
									if cmd:find('%-%-target%s+clean') then
										return 'Clean'
									end

									return 'Build'
								-- cmake --install
								elseif cmd:find('%s+%-%-install') then
									return 'Install'
								end

								-- cmake
								return 'Generate'
							end

							local task_name = get_task_name(task.cmd)

							local problem_matcher = '$gcc' -- also clang matcher
							if task_name == 'Generate' then
								problem_matcher = '$cmake'
							end

							task.name = 'Cmake ' .. task_name
							task:add_components({
								{ 'on_result_diagnostics' },
								{
									'on_output_parse',
									problem_matcher = problem_matcher,
								},
							})
						end,
					},
				},
			},
			cmake_runner = {
				name = 'overseer',
				default_opts = {
					overseer = {
						new_task_opts = {
							strategy = {
								'jobstart',
							},
						},
						on_new_task = function(task)
							task.name = 'Cmake Run'
							task:subscribe('on_start', function()
								require('overseer').open({
									enter = false,
								})
							end)
						end,
					},
				},
			},
			cmake_notifications = {
				runner = { enabled = false },
				executor = { enabled = false },
			},
		},
	},
}

return M
