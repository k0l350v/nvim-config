local M = {}

local plugin_manager_dir = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

local plugin_manager_options = {
	spec = {
		{ import = 'plugins' },
	},
	defaults = { lazy = true },
	checker = { enabled = true }, -- automatically check for plugin updates
	reset_packpath = true,
	performance = {
		rtp = {
			reset = false,
			disabled_plugins = {
				'gzip',
				'matchit',
				'matchparen',
				'netrwPlugin',
				'rplugin',
				'tarPlugin',
				'tohtml',
				'tutor',
				'zipPlugin',
			},
		},
	},
	debug = false,
}

local function prepare_plugin_manager()
	if not vim.loop.fs_stat(plugin_manager_dir) then
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			plugin_manager_dir,
		})
	end
	vim.opt.rtp:prepend(plugin_manager_dir)
end

function M.setup()
	prepare_plugin_manager()

	require('lazy').setup(plugin_manager_options)
end

return M
