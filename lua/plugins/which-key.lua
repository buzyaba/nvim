return {
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
}
