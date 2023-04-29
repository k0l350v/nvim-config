vim.g.mapleader = ' '
local options = require('options')
options.load_defaults()

local keymaps = require('keymaps')
keymaps.load_keymaps()

local plugin_manager = require('plugin_manager')
plugin_manager.setup()
