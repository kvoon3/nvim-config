-- https://www.cnblogs.com/w4ngzhen/p/17493128.html
-- https://github.com/folke/lazy.nvim
-- 准备 lazy.nvim 模块（存在性检测）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- 将 lazypath 设置为 runtime path (rtp)，将 lazy.nvim 模块所在目录加入到 lua 模块搜索路径下，以便可以 require 到 lazy.nvim 模块
vim.opt.rtp:prepend(lazypath)

-- https://github.com/folke/flash.nvim
local flash_plugin = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    mode = "exact",
    autojump = false,
    label = {
      -- style = "",
    },
    highlight = {
      matches = true,
      backdrop = true,
    },
    modes = {
      -- 取消默认 flash find 功能
      char = {
        enabled = false,
        jump_labels = true,
      },
    }
  },
  -- stylua: ignore
  keys = {
    -- 取消默认 s 键功能
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },

    -- search 功能改至 f 键
    { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },

    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}

-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
-- use zig
local treesitter_plugin = {
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

-- https://github.com/kylechui/nvim-surround
local surround_plugin = {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
    })
  end
}

-- 加载 lazy.nvim
require("lazy").setup({
  flash_plugin,
  -- treesitter_plugin,
  surround_plugin,
})
