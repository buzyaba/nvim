return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = { "clangd", "--header-insertion=never", "--fallback-style=webkit" },
      },
    },
  },
}
