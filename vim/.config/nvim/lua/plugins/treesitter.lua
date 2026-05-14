return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup()
      treesitter.install({
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
      })
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
