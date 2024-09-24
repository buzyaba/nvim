return {
 {
     'neovim/nvim-lspconfig',
     dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
     },
     config = function()
         require('mason').setup()
         require('mason-lspconfig').setup({
             ensure_installed = {
                 "clangd",
                 "pyright",
                 "lua_ls",
             },
         })
         local lspconfig = require('lspconfig')
         lspconfig.clangd.setup({})
         lspconfig.pyright.setup({})
         lspconfig.lua_ls.setup({})

         -- keymaps
        local telescope = require('telescope.builtin')
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', telescope.lsp_definitions, {desc = "[G]oto [D]efinition"})
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = "[G]oto [D]declaration"})
        vim.keymap.set('n', 'gI', telescope.lsp_implementations, {desc = "[G]oto [I]mplementation"})
        vim.keymap.set('n', 'gr', telescope.lsp_references, {desc = "[G]oto [R]eferences"})
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {desc = "[C]ode [A]ction"})
     end,
 },
}
