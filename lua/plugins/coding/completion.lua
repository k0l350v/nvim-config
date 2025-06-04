local M = {
	{
		'saghen/blink.cmp',
		build = 'cargo build --release',
		version = '*',
		event = { 'InsertEnter' },
		opts_extend = {
			'sources.completion.enabled_providers',
			'sources.compat',
			'sources.default',
		},
		opts = {
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = 'mono',
			},
			cmdline = {
				enabled = false,
			},
			completion = {
				menu = {
					auto_show = true,
					border = 'rounded',
					draw = {
						treesitter = { 'lsp' },
					},
				},
				accept = {
					auto_brackets = { enabled = true },
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
					window = {
						border = 'rounded',
					},
				},
				ghost_text = {
					enabled = false,
				},
			},
			signature = { window = { border = 'single' } },
		},
	},
	{
		'saghen/blink.cmp',
		opts = function(_, opts)
			opts.appearance = opts.appearance or {}
			opts.appearance.kind_icons =
				vim.tbl_extend('force', opts.appearance.kind_icons or {}, require('icons').kind)
		end,
	},
	{
		'catppuccin',
		optional = true,
		opts = {
			integrations = { blink_cmp = true },
		},
	},
}

return M
