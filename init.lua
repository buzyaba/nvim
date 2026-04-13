-- Remaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---- Disable highlight on ESC when searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({ "v", "n" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({ "v", "n" }, "<leader>p", '"+p', { desc = "Paste after from clipboard" })
vim.keymap.set({ "v", "n" }, "<leader>P", '"+P', { desc = "Paste before from clipboard" })

-- Settings

---- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

---- Render line numbers
vim.opt.number = true
vim.opt.relativenumber = true

---- Render tabs/spaces
vim.opt.list = true
vim.opt.listchars = { tab = ">-", lead = "·", trail = "·" }

---- UI
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  float = { border = "rounded" },
})

---- Search
vim.opt.ignorecase = tru
vim.opt.smartcase = true

---- Buffer editing QoL
vim.opt.undofile = true

---- Autocompletion
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.opt.pumheight = 15

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

local pack_hook = function(ev)
  -- Use available |event-data|
  local name, kind = ev.data.spec.name, ev.data.kind
 -- Run build script after plugin's code has changed
  if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
    -- Append `:wait()` if you need synchronous execution
    vim.system(
      { "cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install" },
      { cwd = ev.data.path }
    )
  end
end

-- If hooks need to run on install, run this before `vim.pack.add()`
-- To act on install from lockfile, run before very first `vim.pack.add()`
vim.api.nvim_create_autocmd("PackChanged", { callback = pack_hook })

-- Install plugins
vim.pack.add({
  -- LSP plugins
  "https://github.com/neovim/nvim-lspconfig",
  -- Themes
  "https://github.com/catppuccin/nvim",
  -- UI
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/which-key.nvim",
  -- Picker
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})
-- Enable experimental UI2
require("vim._core.ui2").enable({})

-- Theme
vim.cmd.colorscheme("catppuccin-mocha")

-- Which-key
require("which-key").setup({
  preset = "helix",
})

vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer local keymaps" })

-- Picker
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Find globally" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Find help" })
vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Find current string" })
vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "Find keymaps" })

local telescope = require("telescope")
telescope.load_extension("fzf")
telescope.setup({
  pickers = {
    live_grep = {
      file_ignore_patterns = { "build/", "build\\", "node_modules", ".git/", ".git\\", ".venv" },
      hidden = true,
      additional_args = { "--hidden" },
    },
    find_files = {
      file_ignore_patterns = { "build/", "build\\", "node_modules", ".git/", ".git\\", ".venv" },
      hidden = true,
    },
    grep_string = {
      file_ignore_patterns = { "build/", "build\\", "node_modules", ".git/", ".git\\", ".venv" },
      hidden = true,
    },
  },
})

-- LSP
local server_list = {
  clangd = {
    cmd = { "clangd", "--header-insertion=never" },
  },
  stylua = {
    cmd = { "stylua", "--lsp", "--search-parent-directories" },
  },
  copilot = {},
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
      vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion" })
    end
    if client:supports_method("textDocument/formatting") then
      vim.keymap.set({ "v", "n" }, "<leader>cf", vim.lsp.buf.format, { desc = "Code format" })
    end
    if client:supports_method("textDocument/inlineCompletion") then
      vim.lsp.inline_completion.enable(true, { client_id = client.id, bufnr = args.buf })

      vim.keymap.set(
        "i",
        "<C-F>",
        vim.lsp.inline_completion.get,
        { desc = "LSP: accept inline completion", buffer = args.buf }
      )
      vim.keymap.set(
        "i",
        "<C-G>",
        vim.lsp.inline_completion.select,
        { desc = "LSP: switch inline completion", buffer = args.buf }
      )
    end
    local telescope = require("telescope.builtin")
    vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "Goto definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
    vim.keymap.set("n", "gI", telescope.lsp_implementations, { desc = "Goto implementation" })
    vim.keymap.set("n", "<leader>s", telescope.lsp_document_symbols, { desc = "Find symbols" })
    vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "Goto references" })
    vim.keymap.set("n", "gR", vim.lsp.buf.rename, { desc = "Rename symbol" })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  end,
})
