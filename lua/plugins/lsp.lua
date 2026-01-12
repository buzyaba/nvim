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
        -- copilot = {},
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
            vim.keymap.set({ "v", "n" }, "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
          end
          -- Enable when 0.12 releases
          -- if client:supports_method("textDocument/inlineCompletion") then
          --   vim.lsp.inline_completion.enable(true, { client_id = client.id, bufnr = args.buf })
          --
          --   vim.keymap.set(
          --     "i",
          --     "<C-F>",
          --     vim.lsp.inline_completion.get,
          --     { desc = "LSP: accept inline completion", buffer = args.buf }
          --   )
          --   vim.keymap.set(
          --     "i",
          --     "<C-G>",
          --     vim.lsp.inline_completion.select,
          --     { desc = "LSP: switch inline completion", buffer = args.buf }
          --   )
          -- end
          local telescope = require("telescope.builtin")
          vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "[G]oto [D]efinition" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]declaration" })
          vim.keymap.set("n", "gI", telescope.lsp_implementations, { desc = "[G]oto [I]mplementation" })
          vim.keymap.set("n", "gO", telescope.lsp_document_symbols, { desc = "Document symbols" })
          vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "[G]oto [R]eferences" })
          vim.keymap.set("n", "gR", vim.lsp.buf.rename, { desc = "[R]ename symbol" })
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
        end,
      })
    end,
  },
}
