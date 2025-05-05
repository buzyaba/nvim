return {
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            local conform = require 'conform'
            conform.setup {
                formatters_by_ft = {
                    lua = { 'stylua' },
                    python = { 'isort', 'black' },
                    cpp = { 'clang-format' },
                    cmake = { 'cmakelang' },
                    markdown = { 'prettier' },
                    json = { 'prettier' },
                    yaml = { 'prettier' },
                },
                vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
                    require('conform').format {
                        lsp_fallback = true,
                        async = false,
                        timemout_ms = 500,
                    }
                end, { desc = '[C]ode [F]ormat' }),
            }
            -- Additional options for various formatters
            conform.formatters['clang-format'] = {
                prepend_args = { '--fallback-style=LLVM' },
            }
        end,
    },
}
