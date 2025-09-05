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
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require('ibl').setup()
        end,
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndo-tree' })
        end,
    },
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup {
                -- Configuration here, or leave empty to use defaults
            }
        end,
    },
}
