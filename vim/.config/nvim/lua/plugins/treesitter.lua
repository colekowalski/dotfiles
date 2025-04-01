return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "cmake",
          "cpp",
          "css",
          "gitignore",
          "go",
          "html",
          "http",
          "java",
          "javascript",
          "lua",
          "rust",
          "scss",
          "sql",
          "typescript",
          "vim",
          "vimdoc"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  }
}
