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

-- 加载 lazy.nvim
require("lazy").setup({
  require("plugins/flash"),
  require("plugins/treesitter"),
  require("plugins/surround"),
})
