return {
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function()
      local server_list = {
        clangd = {
          cmd = { "clangd", "--header-insertion=never" },
        },
        stylua = {},
      }
      for k, v in pairs(server_list) do
        vim.lsp.enable(k)
        vim.lsp.config(k, v)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
            vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger Autocompletion" })
          end
          if client:supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
          end
        end,
      })
    end,
  },
}
