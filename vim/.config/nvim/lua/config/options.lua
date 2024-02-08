local home = os.getenv("HOME")

vim.g.mapleader = ","

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.history = 1000 -- lines of history to remember
vim.opt.undolevels = 1000 -- number of levels of undo
vim.opt.undodir = home .. "/.cache/vim/undo" -- persistent undo
vim.opt.undofile = true

vim.opt.wrap = false -- disable line wrapping
vim.opt.scrolloff = 8 -- more context around the cursor
vim.opt.sidescrolloff = 8

vim.opt.number = true

vim.opt.ignorecase = true -- case-insensitive searching.
vim.opt.smartcase = true -- case-sensitive searching if expression contains a capital letter.
vim.opt.showmatch = true -- show matching char (like {})
vim.opt.wrapscan = true -- circle search

vim.opt.backup = false -- don't create backup files
vim.opt.writebackup = false
vim.opt.swapfile = false

-- tabs and indentation settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.smartindent = true

vim.opt.fixeol = true -- ensure newline at end of file
