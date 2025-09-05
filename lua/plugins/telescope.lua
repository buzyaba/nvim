return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
        config = function()
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find Buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = '[F]ind Current [S]tring' })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
            local telescope = require 'telescope'
            telescope.setup {
                pickers = {
                    live_grep = {
                        file_ignore_patterns = { 'build/', 'build\\', 'node_modules', '.git/', '.git\\', '.venv' },
                        hidden = true,
                        additional_args = { '--hidden' },
                    },
                    find_files = {
                        file_ignore_patterns = { 'build/', 'build\\', 'node_modules', '.git/', '.git\\', '.venv' },
                        hidden = true,
                    },
                    grep_string = {
                        file_ignore_patterns = { 'build/', 'build\\', 'node_modules', '.git/', '.git\\', '.venv' },
                        hidden = true,
                    },
                },
            }
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_REFIX=. && cmake --build build --config Release --target install',
        config = function()
            require('telescope').load_extension 'fzf'
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup {
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {},
                    },
                },
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require('telescope').load_extension 'ui-select'
        end,
    },
}
