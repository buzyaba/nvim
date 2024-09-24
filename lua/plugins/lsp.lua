return {
 {
     'neovim/nvim-lspconfig',
     dependencies = {
         { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
     },
     config = function()
         local lspconfig = require('lspconfig')
         require('mason-lspconfig').setup()
     end,
 },
}
