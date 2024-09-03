local M = {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	opts = {
		signs = {
			add = {
				text = '▍',
			},
			change = {
				text = '▍',
			},
			delete = {
				text = '▍',
			},
			changedelete = {
				text = '▍',
			},
			topdelete = {
				text = '‾',
			},
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

			map({ 'n', 'v' }, '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
			map({ 'n', 'v' }, '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
			map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
			map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
			map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
			map('n', '<leader>gh', gs.preview_hunk, { desc = 'Hunk preview' })

			map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, { desc = 'Blame Line' })
		end
	}
}

return M
