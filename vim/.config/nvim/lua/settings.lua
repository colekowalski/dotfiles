local opt = vim.opt

vim.opt.ignorecase = true   -- case insensitive searching
vim.opt.smartcase = true    -- case-sensitive searching if expression contains a capital letter
vim.opt.showmatch = true    -- show matching char (like {})
vim.opt.wrapscan = true     -- wrap to beginning after last search result

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true   -- round indent to multiple of `shiftwidth`
vim.opt.smartindent = true  -- use smart autoindenting when starting a new line

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
