return {
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            require('conform').setup {
                formatters_by_ft = {
                    lua = { 'stylua' },
                    python = { 'isort', 'black' },
                    cpp = { 'clang-format' },
                    markdown = { 'markdownlint' },
                },
                vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
                    require('conform').format {
                        lsp_fallback = true,
                        async = false,
                        timemout_ms = 500,
                    }
                end, { desc = '[C]ode [F]ormat' }),
            }
        end,
    },
}
