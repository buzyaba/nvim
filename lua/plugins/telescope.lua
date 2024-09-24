return {
    {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find Buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = '[F]ind Current [S]tring' })
	end,

    },
	{ 
	    'nvim-telescope/telescope-fzf-native.nvim',
	     build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_REFIX=. && cmake --build build --config Release --target install',
	     config = function()
		     require('telescope').load_extension('fzf')
	     end,
	},
}
