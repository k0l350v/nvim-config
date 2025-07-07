vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local options = require('options')
options.load_defaults()

local keymaps = require('keymaps')
keymaps.load_keymaps()

local autocmds = require('autocmds')
autocmds.setup()

local plugin_manager = require('plugin_manager')
plugin_manager.setup()
