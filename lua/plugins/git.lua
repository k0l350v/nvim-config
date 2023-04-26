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

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

			map('n', ']h', gs.next_hunk, 'Next hunk')
			map('n', '[h', gs.prev_hunk, 'Previous hunk')

			map({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', 'Stage hunk')
			map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', 'Reset hunk')
			map('n', '<leader>gS', gs.stage_buffer, 'Stage buffer')
			map('n', '<leader>gR', gs.reset_buffer, 'Reset buffer')
			map('n', '<leader>gu', gs.undo_stage_hunk, 'Undo stage hunk')
			map('n', '<leader>gh', gs.preview_hunk, 'Hunk preview')

			map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, 'Blame Line')
		end
	}
}

return M
