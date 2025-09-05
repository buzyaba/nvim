return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('mason').setup()
            local server_list = {
                clangd = {
                    cmd = { 'clangd', '--header-insertion=never' },
                },
                pyright = {},
                lua_ls = {},
                cmake = {},
            }
            local server_keys = {}
            local n = 0
            for k, v in pairs(server_list) do
                n = n + 1
                server_keys[n] = k
            end
            require('mason-lspconfig').setup {
                ensure_installed = server_keys,
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for k, v in pairs(server_list) do
                local server_config = {
                    capabilities = capabilities,
                }
                for cfg, val in pairs(v) do
                    server_config[cfg] = val
                end
                vim.lsp.enable(k)
                vim.lsp.config(k, server_config)
            end

            -- keymaps
            local telescope = require 'telescope.builtin'
            vim.keymap.set('n', 'gd', telescope.lsp_definitions, { desc = '[G]oto [D]efinition' })
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]declaration' })
            vim.keymap.set('n', 'gI', telescope.lsp_implementations, { desc = '[G]oto [I]mplementation' })
            vim.keymap.set('n', 'gr', telescope.lsp_references, { desc = '[G]oto [R]eferences' })
            vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { desc = '[R]ename symbol' })
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
        end,
    },
}
