return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'catppuccin-mocha'
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
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = {
                        { 'mode', separator = { left = '' } },
                    },
                    lualine_z = {
                        { 'location', separator = { right = '' } },
                    },
                },
            }
        end,
    },
}
