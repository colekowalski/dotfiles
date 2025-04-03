vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/playbooks/*.yml",
    "*/playbooks/*.yaml",
    "*/roles/*/tasks/*.yml",
    "*/roles/*/tasks/*.yaml",
    "*/roles/*/handlers/*.yml",
    "*/roles/*/handlers/*.yaml",
    "*/roles/*/defaults/*.yml",
    "*/roles/*/defaults/*.yaml",
    "*/roles/*/vars/*.yml",
    "*/roles/*/vars/*.yaml",
    "*/roles/*/meta/*.yml",
    "*/roles/*/meta/*.yaml",
    "*/ansible/*.yml",
    "*/ansible/*.yaml",
    "*ansible.yml",
    "*ansible.yaml"
  },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})
