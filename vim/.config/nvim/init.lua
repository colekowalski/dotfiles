-- Make sure these are configured before loading lazy.nvim so that any
-- configured mappings are correct
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

require("settings")

-- Load lazy.vim and managed plugins
require("config.lazy")
