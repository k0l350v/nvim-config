vim.g.mapleader = ' '
local options = require('options')
options.load_defaults()

local plugin_manager = require('plugin_manager')
plugin_manager.setup()
