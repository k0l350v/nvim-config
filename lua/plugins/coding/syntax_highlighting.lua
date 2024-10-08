local M = {
	'nvim-treesitter/nvim-treesitter',
	version = false,
    build = ":TSUpdate",
    event = "BufReadPost",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			'bash',
			'c_sharp',
			'diff',
			'fish',
			'gitignore',
			'go',
			'html',
			'http',
			'java',
			'javascript',
			'json',
			'jsdoc',
			'jsonc',
			'kotlin',
			'latex',
			'llvm',
			'markdown',
			'markdown_inline',
			'ninja',
			'pascal',
			'query',
			'regex',
			'ruby',
			'rust',
			'scala',
			'sql',
			'swift',
			'sxhkdrc',
			'vim',
			'yaml',
		}
	}
}

function M.config(_, opts)
	require('nvim-treesitter.configs').setup(opts)
end

return M
