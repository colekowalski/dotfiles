-- Neovim 0.11+ can use vim.lsp.config as a replacement for nvim-lspconfig. It
-- may be worthwhile to switch over once 0.11 has been released
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "saghen/blink.cmp" },
  },
  opts = {
    servers = {
      bashls = {},
      clangd = {},
      cmake = {},
      gopls = {},
      lua_ls = {},
      ruff = {},
      rust_analyzer = {},
      terraform_ls = {},
      ts_ls = {},
    }
  },
  config = function(_, opts)
    require("mason").setup()
    require("mason-lspconfig").setup()

    local blink = require("blink.cmp")
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = blink.get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
