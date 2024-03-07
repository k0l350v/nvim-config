local M = {
	'Civitasv/cmake-tools.nvim',
	commit = 'aba5b805082b3c1027ac4f5051b84c61989c34c8',
	dependencies = {
		'stevearc/overseer.nvim',
		opts = {
			task_list = {
				direction = 'bottom',
				max_width = 0.4,
				max_height = 0.6,
			}
		},
	},
	cmd = {
		'CMakeGenerate',
		'CMakeBuild',
		'CMakeRun',
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
							'terminal',
							open_on_start = false,
						},
					},
					on_new_task = function (task)
						task:subscribe('on_start', function()
							require('overseer').open({
								enter = false,
							})
						end)
					end
				},
			},
		},
		cmake_notifications = {
			runner = { enabled = false },
			executor = { enabled = false }
		}
	},
}

return M
