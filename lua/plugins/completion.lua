return {
    {
         'L3MON4D3/LuaSnip',
         dependencies = {
            'saadparwaiz1/cmp_luasnip'
         },
    },
    {
         -- cmp
         'hrsh7th/nvim-cmp',
         dependencies = {
             'neovim/nvim-lspconfig',
             'hrsh7th/cmp-nvim-lsp',
             'hrsh7th/cmp-buffer',
             'hrsh7th/cmp-path',
             'hrsh7th/cmp-cmdline',
             'L3MON4D3/LuaSnip',
             'zbinerbaum/copilot-cmp'
         },
         config = function()
              local cmp = require('cmp')

              cmp.setup({
                snippet = {
                  -- REQUIRED - you must specify a snippet engine
                  expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                  end,
                },
                window = {
                  -- completion = cmp.config.window.bordered(),
                  -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' }, -- For luasnip users.
                  { name = 'copilot'},
                }, {
                  { name = 'buffer' },
                })
              })

              -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
              cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                  { name = 'buffer' }
                }
              })

              -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
              cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                  { name = 'path' }
                }, {
                  { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
              })


         end,
     }
 }
