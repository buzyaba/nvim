return {
    {
        'catppuccin/nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'catppuccin-mocha'
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#BAC2DE' })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = '#F9E2AF' })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#BAC2DE' })
        end,
    },

    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            spec = {
                { '<leader>c', group = '[C]ode' },
                { '<leader>f', group = '[F]ind' },
            },
        },
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show { global = false }
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local startify = require 'alpha.themes.startify'
            startify.file_icons.provider = 'devicons'
            require('alpha').setup(startify.config)
        end,
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('oil').setup {
                view_options = {
                    show_hidden = true,
                },
            }
            vim.keymap.set('n', '<leader>-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
        end,
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.ai').setup()
            require('mini.surround').setup()
            require('mini.statusline').setup()
        end,
    },
}
