return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'zschreur/telescope-jj.nvim',
    },
    config = function()
      local telescope = require("telescope")
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "jj")
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Telescope buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Telescope help tags" },
      { "<leader>fr", "<cmd>Telescope registers<cr>",  desc = "Telescope registers" },

      {
        "<leader>sf",
        function()
          -- Try jj first
          local jj_ok = pcall(require("telescope").extensions.jj.files)
          if jj_ok then
            return
          end
          -- Fallback to find_files (works everywhere)
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find files (jj/git aware)",
      },
      {
        "<leader>sj",
        function()
          require("telescope").extensions.jj.diff()
        end,
        desc = "jj diff (changed files)",
      },
    }
  }
}
