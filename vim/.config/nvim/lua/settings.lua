local home = os.getenv('HOME')
local opt = vim.opt

vim.g.mapleader = ','

opt.history = 1000                -- lines of history to remember
opt.undolevels = 1000             -- number of levels of undo
opt.undodir = home .. '/.cache/vim/undo' -- persistent undo
opt.undofile = true

opt.wrap = false                  -- disable line wrapping
opt.scrolloff = 8                 -- more context around the cursor
opt.sidescrolloff = 8

opt.number = true                 -- show line numbers.
opt.ruler = true                  -- show cursor position.
opt.cursorline = true             -- show cursor position.

opt.ignorecase = true             -- case-insensitive searching.
opt.smartcase = true              -- case-sensitive searching if expression contains a capital letter.
opt.showmatch = true              -- show matching char (like {})
opt.wrapscan = true               -- circle search

opt.backup = false                -- don't create backup files
opt.writebackup = false
opt.swapfile = false

-- tabs and indentation settings
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.smartindent = true
