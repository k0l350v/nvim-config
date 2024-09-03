local M = {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	opts = {
		signs = {
			add = { text = '▎' },
			change = { text = '▎' },
			delete = { text = '' },
			topdelete = { text = '' },
			changedelete = { text = '▎' },
			untracked = { text = '▎' },
		},
		signs_staged = {
			add = { text = '▎' },
			change = { text = '▎' },
			delete = { text = '' },
			topdelete = { text = '' },
			changedelete = { text = '▎' },
		},
		current_line_blame = true,
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = buffer
				vim.keymap.set(mode, l, r, opts)
			end

			map('n', ']h', gs.next_hunk, { dot_repeat = true, desc = 'Next hunk' })
			map('n', '[h', gs.prev_hunk, { dot_repeat = true, desc = 'Previous hunk' })

			map({ 'n' }, '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
			map({ 'n' }, '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })

			map('v', '<leader>gs', function()
				gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, { desc = 'Stage Hunk' })

			map('v', '<leader>gr', function()
				gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, { desc = 'Reset Hunk' })

			map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
			map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
			map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
			map('n', '<leader>gH', gs.preview_hunk, { desc = 'Hunk preview' })
			map('n', '<leader>gh', gs.preview_hunk_inline, { desc = 'Hunk preview' })

			map('n', '<leader>gb', function()
				gs.blame_line({ full = true })
			end, { desc = 'Blame Line' })

			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		end,
	},
}

return M
