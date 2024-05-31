local M = {}

local default_options = {
	shiftwidth = 4,
	tabstop = 4,
	smartindent = true,
	copyindent = true,

	number = true,
	numberwidth = 4,
	relativenumber = true,

	signcolumn = 'yes',
	completeopt = { 'menuone', 'noselect' },
	clipboard = 'unnamedplus',
	cursorline = true,
	undofile = true,
	termguicolors = true,
	cmdheight = 2,
	title = true,
	fileencoding = 'utf-8',
	updatetime = 200,
	hidden = true,
	laststatus = 3,
	hlsearch = true,

	splitbelow = true,
	splitright = true,

	scrolloff = 2,
	sidescrolloff = 2,
	wrap = false,

	writebackup = false,
	backup = false,

	ignorecase = true,
	smartcase = true,
	mouse = '',

	fillchars = {
		foldopen = '',
		foldclose = '',
		fold = ' ',
		foldsep = ' ',
		diff = '╱',
		eob = ' ',
	},
}

function M.load_defaults()
	for k, v in pairs(default_options) do
		vim.opt[k] = v
	end
end

return M
