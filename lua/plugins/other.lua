return {
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('ibl').setup()
        end,
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
}
