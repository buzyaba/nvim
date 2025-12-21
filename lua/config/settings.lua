local opt = vim.opt

-- Indentation
opt.tabstop     = 4
opt.shiftwidth  = 4
opt.softtabstop = 4
opt.expandtab   = true
opt.smartindent = true

-- Render line numbers
opt.number         = true
opt.relativenumber = true

-- Render tabs/spaces
opt.list = true
opt.listchars = { tab = '>-', lead = '·', trail = '-' }

-- UI
opt.termguicolors = true
opt.cursorline    = true
opt.colorcolumn   = '100'
opt.mouse         = 'a'
opt.signcolumn    = 'yes'
opt.scrolloff     = 10

-- Search
opt.ignorecase = true
opt.smartcase  = true

-- Buffer editing QoL
opt.undofile = true
