return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
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
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "rust",
          "scss",
          "sql",
          "terraform",
          "toml",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
