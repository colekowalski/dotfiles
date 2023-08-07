require('plugins')
require('settings')
require('lsp')

require('onedark').setup {
  style = 'darker'
}
require('onedark').load()

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>za', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "gi", builtin.lsp_implementations)
vim.keymap.set("n", "<space>o", builtin.lsp_document_symbols)
vim.keymap.set("n", "<space>s", builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set("n", "<space>d", builtin.diagnostics)

require('lualine').setup {
  -- options = { theme = 'nord' },
  sections = {
    lualine_c = {{ 'filename', path = 3 }},
  }
}

-- autocomplete
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    {
      name = 'buffer',
      option = {
        keyword_length = 3,
        option = { get_bufnrs = get_bufnrs_unless_huge },
      }
    },
  },
})

-- nvim-surround
require('nvim-surround').setup({})
