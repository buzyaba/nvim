return {
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup {
                suggestion = { enabled = false },
                panel = { enabled = false },
                filetypes = {
                    markdown = true,
                    yaml = true,
                },
            }
        end,
    },
    {
        'zbirenbaum/copilot-cmp',
        config = function()
            require('copilot_cmp').setup()
        end,
    },
    {
        'yetone/avante.nvim',
        event = 'VeryLazy',
        lazy = false,
        version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
        opts = {
            -- add any opts here
            provider = 'copilot',
            mode = 'legacy',
            providers = {
                copilot = {
                    disable_tools = true,
                },
            },
        },

        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = (function()
            if vim.fn.has 'win32' == 1 and vim.fn.has 'wsl' ~= 0 then
                return 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
            else
                return 'make'
            end
        end)(),
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            --- The below dependencies are optional,
            'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
            'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
            'zbirenbaum/copilot.lua', -- for providers='copilot'
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { 'markdown', 'Avante' },
                },
                ft = { 'markdown', 'Avante' },
            },
        },
    },
}
