-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#zig
local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "html",
        "vue",
        "typescript",
        "tsx",
        "json",
        "json5",
        "yaml",
        "toml",
        "svelte",
        "proto",
        "scss",
        "jsdoc",
      },
      sync_install = false,
      highlight = { enable = false },
      indent = { enable = true },
    })
  end
}

return treesitter