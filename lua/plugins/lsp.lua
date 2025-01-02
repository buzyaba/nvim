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
                clangd = {},
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
            local lspconfig = require 'lspconfig'
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for k, v in pairs(server_list) do
                lspconfig[k].setup(v)
                lspconfig[k].setup {
                    capabilities = capabilities,
                }
            end

            -- keymaps
            local telescope = require 'telescope.builtin'
            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', telescope.lsp_definitions, { desc = '[G]oto [D]efinition' })
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]declaration' })
            vim.keymap.set('n', 'gI', telescope.lsp_implementations, { desc = '[G]oto [I]mplementation' })
            vim.keymap.set('n', 'gr', telescope.lsp_references, { desc = '[G]oto [R]eferences' })
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
        end,
    },
}
