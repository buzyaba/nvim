return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
        filesystem = {
            filtered_items = {
                hide_gitignored = true,
                hide_dotfiles = false,
                hide_by_name = {
                    '.git',
                },
            },
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                },
            },
        },
    },
}
