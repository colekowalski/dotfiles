return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
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
                    "vimdoc",
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
